import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id;
  final String firstName;
  final String lastName;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Person.fromJson(Map<String, dynamic> json) => PersonFromJson(json);

  Map<String, dynamic> toJson() => PersonToJson(this);
}
