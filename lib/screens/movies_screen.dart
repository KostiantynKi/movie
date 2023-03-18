import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/movies_cubit.dart';
import 'package:movies/screens/error_screen.dart';
import 'package:movies/screens/movie_start_screen.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoaded) {
            return const MovieStartPage();
          } else if (state is MoviesError) {
            return const ErrorMovieScreen();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
