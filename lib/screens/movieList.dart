import 'package:flutter/material.dart';
import 'package:movie_mania/models/fetchMovies.dart';
import 'package:movie_mania/screens/topScreen.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  Future future;

  @override
  void initState() {
    future = Provider.of<FetchData>(context, listen: false).fetchTopMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated Movies"),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.indigo, Colors.teal])),
          child: topWidget(future)),
    );
  }
}
