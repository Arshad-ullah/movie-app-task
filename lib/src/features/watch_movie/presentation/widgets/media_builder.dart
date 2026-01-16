import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/media_entity.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';

class MediaEntityBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, MediaEntity media) builder;

  const MediaEntityBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchMovieBloc, WatchMovieState>(
      buildWhen: (p, c) => p.mediaEntity != c.mediaEntity,
      builder: (context, state) {
        final media = state.mediaEntity;
        if (media == null) {
          return const SizedBox.shrink();
        }
        return builder(context, media);
      },
    );
  }
}
