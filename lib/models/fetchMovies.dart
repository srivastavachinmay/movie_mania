import 'package:flutter/cupertino.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api.dart';

class FetchMovies with ChangeNotifier {

  Future<List<Movie>> fetchTopMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=${Api.key}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }
}
