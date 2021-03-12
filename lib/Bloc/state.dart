import 'package:equatable/equatable.dart';
import 'package:music_player/Model/tracklistmodel.dart';

abstract class TracksState extends Equatable {
  @override
  List<Object> get props => [];
}

class TracksInitState extends TracksState {}

class TracksLoading extends TracksState {}

class TracksLoaded extends TracksState {

final List<Tracklist> tracks;
TracksLoaded({this.tracks});

}

class TracksListError extends TracksState {
  final error;
  TracksListError({this.error});
}

