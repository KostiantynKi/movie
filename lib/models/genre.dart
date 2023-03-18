import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final int id;
  final String title;

  Genre({
    required this.id,
    required this.title,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => GenreFromJson(json);
  Map<String, dynamic> toJson() => GenreToJson(this);
}
