import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/di/injection_container.dart' as di;
import 'package:movie_app/src/features/bottombar/presentation/widgets/bottomar_widget.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';
import 'package:movie_app/src/features/watch_movie/presentation/pages/watch_movie_screen.dart';
import '../bloc/bottombar_bloc.dart';

class BottombarScreen extends StatelessWidget {
  const BottombarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottombarBloc, BottombarState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildCurrentScreen(state.currentIndex),
          bottomNavigationBar: BottomNavBar(currentIndex: state.currentIndex),
        );
      },
    );
  }

  Widget _buildCurrentScreen(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Dashboard'));
      case 1:
        return WatchMovieScreen();
      case 2:
        return const Center(child: Text('Media Library'));
      case 3:
        return const Center(child: Text('More'));
      default:
        return const Center(child: Text('Dashboard'));
    }
  }
}
