import 'package:movies/models/genre.dart';
import 'package:movies/models/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int? id;
  final String? title;
  final String? description;
  final int? releaseYear;
  final String? mpaRating;
  final double? imdbRating;
  final int? duration;
  final String? posterUrl;
  final String? bgPictureUrl;
  final List<Genre>? genres;
  final List<Person>? directors;
  final List<Person>? writers;
  final List<Person>? stars;

  Movie({
    this.id,
    this.title,
    this.description,
    this.releaseYear,
    this.mpaRating,
    this.imdbRating,
    this.duration,
    this.posterUrl,
    this.bgPictureUrl,
    this.genres,
    this.directors,
    this.writers,
    this.stars,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => MovieFromJson(json);
  Map<String, dynamic> toJson() => MovieToJson(this);
}
