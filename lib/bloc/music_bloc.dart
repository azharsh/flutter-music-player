import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/bloc/music_event.dart';
import 'package:flutter_music_player/bloc/music_state.dart';
import 'package:flutter_music_player/model/music_response.dart';

import '../repository/repository.dart';
import 'base.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final Repository repository;

  MusicBloc({required this.repository}) : super(Empty()){
    on<GetMusic>((event, emit) async {
      emit(Loading());
      final failureOrGetMe = await repository.getMusic(event.term);
      if(failureOrGetMe== null){
        emit(Empty());
      }else {
        emit(Loaded(listMusic: failureOrGetMe));
      }
    });
  }
}
