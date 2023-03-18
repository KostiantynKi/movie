import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubit/movies_cubit.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:movies/screens/movies_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MoviesRepository moviesRepository = MoviesRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            titleLarge: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headlineLarge: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MoviesCubit(moviesRepository)..fetchMovies(),
        child: MoviesScreen(),
      ),
    );
  }
}
