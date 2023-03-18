import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/models/http_response.dart';
import 'package:movies/repository/movies_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesCubit(this._moviesRepository) : super(MoviesInitial());

  Future<void> fetchMovies() async {
    try {
      emit(MoviesLoading());
      final movies = await _moviesRepository.getResults();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
