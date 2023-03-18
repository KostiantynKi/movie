// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'last_name': instance.firstName,
      'last_name': instance.lastName,
    };
