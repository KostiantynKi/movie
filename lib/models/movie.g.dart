// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      releaseYear: json['release_year'] as int,
      mpaRating: json['mpa_rating'] as String,
      imdbRating: (json['imdb_rating'] as num).toDouble(),
      duration: json['duration'] as int,
      posterUrl: json['poster'] as String,
      bgPictureUrl: json['bg_picture'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      directors: (json['directors'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      writers: (json['writers'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: (json['stars'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'releaseYear': instance.releaseYear,
      'mpaRating': instance.mpaRating,
      'imdbRating': instance.imdbRating,
      'duration': instance.duration,
      'posterUrl': instance.posterUrl,
      'bgPictureUrl': instance.bgPictureUrl,
      'genres': instance.genres,
      'directors': instance.directors,
      'writers': instance.writers,
      'stars': instance.stars,
    };
