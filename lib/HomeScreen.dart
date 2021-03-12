import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Bloc/bloc.dart';
import 'package:music_player/Bloc/state.dart';
import 'package:music_player/Model/tracklistmodel.dart';
import 'package:music_player/widgets/TredingListwidget.dart';
import 'package:music_player/Bloc/event.dart';
import 'package:music_player/widgets/errorwidget.dart';
import 'package:music_player/widgets/loading.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    _loadTracks();
  }

_loadTracks() async {
    context.bloc<TracksBloc>().add(TrackEvents.fetchtracks);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Trending',style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: Container(
      child: _body()
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<TracksBloc, TracksState>(
            builder: (BuildContext context, TracksState state) {
          if (state is TracksListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadTracks(),
            );
          }
          if (state is TracksLoaded) {
            List<Tracklist> tracks = state.tracks;
            return _list(tracks);
          }
          return Loading();
        }),
      ],
    );
  }


   Widget _list(List<Tracklist> tracks) {
    return Container(
      child: ListView.builder(
        itemCount: tracks.length,
        itemBuilder: (_, index) {
          Tracklist track = tracks[index];
          return TrendingList(tracks: track,);
        }
   )
  );
 }
}
