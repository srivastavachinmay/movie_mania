import 'package:flutter/cupertino.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_mania/models/movieVideo.dart';
import 'dart:convert';
import '../utils/api.dart';

class FetchData with ChangeNotifier {
  MovieVideo _movieVideo;

  MovieVideo get movieVideo => _movieVideo;

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

  Future<List<Result>> fetchVideoDetails(int id) async {
    String url =
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=4d317486a1409c2f941880e08678affa&language=en-US";
    final response = await http.get((Uri.parse(url)));
    if (response.statusCode == 200) {
      MovieVideo movieVideo = MovieVideo.fromJson(json.decode(response.body));
      print('Hello ${movieVideo.results[0].key}');
      return movieVideo.results;
      notifyListeners();
    }
  }
}
