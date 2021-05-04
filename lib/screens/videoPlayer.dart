import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_mania/models/fetchMovies.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final Movie movie;

  VideoPlayer({this.movie});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  Future future;

  @override
  void initState() {
    // TODO: implement initState
    future = Provider.of<FetchData>(context, listen: false)
        .fetchVideoDetails(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshot.error != null) {
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: dataSnapshot.data[0].key,
                flags: YoutubePlayerFlags(
                  hideControls: false,
                  controlsVisibleAtStart: true,
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
            );
          }
        }
      },
    );
  }
}
