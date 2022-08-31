


import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_music_player/model/music_response.dart';


@immutable
abstract class MusicState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends MusicState {}

class Loading extends MusicState {}

class Loaded extends MusicState {
  final MusicResponse? listMusic;

  Loaded({required this.listMusic});
}

class Error extends MusicState {
  final String message;

  Error({required this.message});
}