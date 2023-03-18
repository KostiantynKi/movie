// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response ResponseFromJson(Map<String, dynamic> json) => Response(
      total: json['total'] as int,
      pages: json['pages'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> ResponseToJson(Response instance) => <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'results': instance.results,
    };
