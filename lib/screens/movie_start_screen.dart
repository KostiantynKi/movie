import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/movies_cubit.dart';
import 'package:movies/movie_item.dart';
import 'package:movies/screens/movie_details_screen.dart';

class MovieStartPage extends StatefulWidget {
  const MovieStartPage({super.key});

  @override
  State<MovieStartPage> createState() => _MovieStartPageState();
}

class _MovieStartPageState extends State<MovieStartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          final movies = state.movies;

          return GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: movies.results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (BuildContext context, int index) {
              final movie = movies.results[index];
              return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 22, 8, 8),
                    child: MovieItem(movieState: movies.results, index: index),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailsScreen(movie: movie, index: index)),
                    );
                  });
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
