
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class MusicEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMusic extends MusicEvent {
  final String term;

  GetMusic(this.term);


}

