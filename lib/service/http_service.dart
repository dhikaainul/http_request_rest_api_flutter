import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:http_request_rest_api_flutter/models/movie.dart';

class HttpService {
  final String apiKey = 'f1756ce41d29f6187c4e43594f37a5a6';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=f1756ce41d29f6187c4e43594f37a5a6&language=en-US&page=1';

  Future<List> getPopulerMovies() async {
    final String uri = baseUrl + apiKey;
    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
