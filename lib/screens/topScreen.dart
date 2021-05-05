import 'package:flutter/material.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:movie_mania/screens/detailScreen.dart';
import 'package:flutter/services.dart';

class topWidget extends StatelessWidget {
  final Future _future;

  topWidget(this._future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  print(index);
                  final Movie movie = dataSnapshot.data[index];

                  return ListTile(
                    title: InkWell(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w500" +
                                        movie.poster_path),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Padding(padding: const EdgeInsets.all(8.0)),
                                    Text(
                                      "TMDB Rating: " +
                                          movie.vote_average.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return new DetailWidget(
                              movie: movie,
                            );
                          }));
                        }),
                  );
                },
              );
            }
          }
        });
  }
}
