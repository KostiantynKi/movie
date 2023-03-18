// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
