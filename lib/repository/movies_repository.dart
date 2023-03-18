import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:movies/models/http_response.dart';

class MoviesRepository {
  final url = Uri.https(
    'live.mocat.amifactory.network',
    '/api/v1/movies',
  );

  Future<Response> getResults() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final Response results = Response.fromJson(jsonResponse);
      return results;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
