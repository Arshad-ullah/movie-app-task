import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const TrailerPlayerScreen({super.key, required this.videoUrl});

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
      ),
    )..addListener(_videoListener);
  }

  void _videoListener() {
    if (_controller.value.playerState == PlayerState.ended) {
      _exitPlayer();
    }
  }

  void _exitPlayer() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    context.pop();
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlack,
      body: Stack(
        children: [
          // showing video..
          Center(child: YoutubePlayer(controller: _controller)),

          // done button
          Positioned(top: 16.h, left: 16.w, child: _doneButton()),
        ],
      ),
    );
  }

  InkWell _doneButton() {
    return InkWell(
      onTap: _exitPlayer,
      borderRadius: BorderRadius.circular(12.r),
      splashColor: AppColor.kBlue15D2BC.withValues(alpha: 0.3),
      highlightColor: AppColor.kBlue15D2BC.withValues(alpha: 0.1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColor.kBlue61C3F2, AppColor.kBlue15D2BC],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColor.kBlue61C3F2.withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Done',
            style: TextStyle(
              color: AppColor.kWhite,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
