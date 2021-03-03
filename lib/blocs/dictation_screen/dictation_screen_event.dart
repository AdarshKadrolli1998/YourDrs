import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_event.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

abstract class AudioBlocEvent extends BaseBlocEvent {}

class InitRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class StartRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class TimerTicked extends AudioBlocEvent {
  final Recording recording;

  TimerTicked(this.recording);

  @override
  List<Object> get props => [this.recording];
}

class PauseRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class ResumeRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class StopRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class DeleteRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class SaveRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}
