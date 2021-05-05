import 'package:movie_mania/models/fetchMovies.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:movie_mania/screens/movieList.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FetchData(),
        ),
      ],
      child: MaterialApp(title: 'Movie Mania', home: MovieListScreen()),
    );
  }
}
