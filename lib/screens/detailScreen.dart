import 'package:flutter/material.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:movie_mania/screens/videoPlayer.dart';

class DetailWidget extends StatelessWidget {
  final Movie movie;

  DetailWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(movie.title),),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.indigo, Colors.teal]),
          ),
          child: Stack(fit: StackFit.expand, children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        width: 500.0,
                        height: 500.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500" +
                                    movie.poster_path),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 0.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      movie.overview,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: const EdgeInsets.all(10.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        textStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      child: Text(
                        'Play Trailer',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return new VideoPlayer(
                                movie: movie,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
