import 'package:flutter/material.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:movie_mania/screens/videoPlayer.dart';

class DetailWidget extends StatelessWidget {
  final Movie movie;

  DetailWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 450.0,
                    height: 450.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                            movie.poster_path),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        movie.title,
                        style: TextStyle(color: Colors.black, fontSize: 30.0),
                      )),
                      Text(
                        '${movie.vote_average}/10',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      )
                    ],
                  ),
                ),
                Text(movie.overview, style: TextStyle(color: Colors.black)),
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
    );
  }
}
