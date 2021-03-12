import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Bloc/event.dart';
import 'package:music_player/Bloc/state.dart';
import 'package:music_player/Model/tracklistmodel.dart';
import 'package:music_player/repository.dart';
import 'package:music_player/Exception.dart';


class TracksBloc extends Bloc<TrackEvents, TracksState> {

  TracksBloc(TracksState initialState, this._repositry) : super(initialState);

  
  final Repositry _repositry;


  List<Tracklist> tracks;

  
  

  @override
  Stream<TracksState> mapEventToState(TrackEvents event) async* {

    switch (event) {

      case TrackEvents.fetchtracks:
        yield TracksLoading();
        try {
         tracks  = await _repositry.fetchtracklist();
          yield TracksLoaded(tracks: tracks);
        } on SocketException {

          yield TracksListError(
            error: NoInternetException(message: 'No Internet Found'),
          );
        } on HttpException {

          yield TracksListError(
            error: NoServiceFoundException(message: 'No Service Found'),
          );
        } on FormatException {
          yield TracksListError(
            error: InvalidFormatException(message: 'Invalid Response format'),
          );
        } catch (e) {
          yield TracksListError(
            error: UnknownException(message: 'Unknown Error'),
          );
        }break;
    }
  }
}