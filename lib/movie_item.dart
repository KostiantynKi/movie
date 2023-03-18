import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/models/movie.dart';

class MovieItem extends StatelessWidget {
  List<Movie> movieState;
  int index;
  MovieItem({required this.index, required this.movieState, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: GridTile(
        footer: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(233, 141, 75, 1),
                ),
                Text(
                  '${movieState[index].imdbRating}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  ' /10',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Text(
              '${movieState[index].title}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 68.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(movieState[index].posterUrl ??
                    "https://demofree.sirv.com/nope-not-here.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
