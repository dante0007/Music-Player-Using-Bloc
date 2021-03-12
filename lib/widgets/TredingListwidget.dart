import 'package:flutter/material.dart';
import 'package:music_player/Model/tracklistmodel.dart';

class TrendingList extends StatelessWidget {

  final Tracklist tracks;

  const TrendingList({Key key, this.tracks}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 5.0,
    semanticContainer: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
    ),
    child: Container(
      height: 70,
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
        Icon(Icons.library_music),
        SizedBox(width:20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(tracks.message.body.trackList[0].track.trackName),
            SizedBox(height: 5.0,),
            Text(tracks.message.body.trackList[0].track.albumName)
          ],
        ),
        Text(tracks.message.body.trackList[0].track.artistName),
       ],
     )
    ),
    );
  }
}
