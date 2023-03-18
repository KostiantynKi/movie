import 'package:json_annotation/json_annotation.dart';
import 'package:movies/models/movie.dart';

part 'http_response.g.dart';

@JsonSerializable()
class Response {
  final int total;
  final int pages;
  final List<Movie> results;

  Response({
    required this.total,
    required this.pages,
    required this.results,
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      ResponseFromJson(json);

  Map<String, dynamic> toJson() => ResponseToJson(this);
}
