import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_event.dart';

abstract class PlayAudioEvent extends BaseBlocEvent {}

//----initializing the player
class InitPlayer extends PlayAudioEvent {
  @override
  List<Object> get props => [];
}

//----event for start player
class StartPlayer extends PlayAudioEvent {
  @override
  List<Object> get props => [];
}

//----event for Pause player
class PausePlayer extends PlayAudioEvent {
  @override
  List<Object> get props => [];
}

//----event for Stop player
class StopPlayer extends PlayAudioEvent {
  @override
  List<Object> get props => [];
}

//----event for Completed
class CompletePlayer extends PlayAudioEvent {
  @override
  List<Object> get props => [];
}

class DisposePlayer extends PlayAudioEvent {
  @override
  List<Object> get props => [];
}