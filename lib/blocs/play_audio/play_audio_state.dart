import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_state.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/play_audio.dart';

/// play audio state to maintain all the required states
class PlayAudioState extends BaseBlocState {
  final String errorMsg;
  final Duration position;
  final PlayerState playerState;
  final Duration duration;

  factory PlayAudioState.initial() => PlayAudioState(
    errorMsg: null,
    duration: null,
    position: null,
    playerState: PlayerState.stopped,
  );

  PlayAudioState reset() => PlayAudioState.initial();

  PlayAudioState({
    this.errorMsg,
    this.duration,
    this.position,
    this.playerState,
  });

  @override
  List<Object> get props => [
    this.errorMsg,
    this.duration,
    this.playerState,
    this.position
  ];

  PlayAudioState copyWith({
    String errorMsg,
    Duration duration,
    Duration position,
    PlayerState playerState
  }) {
    return new PlayAudioState(
      errorMsg: errorMsg ?? this.errorMsg,
      position: position ?? this.position,
      duration:duration ?? this.duration,
      playerState:  playerState ?? this.playerState,
    );
  }

  @override
  String toString() {
    return 'AudioBlocState{errorMsg: $errorMsg, duration: $duration, playerState: $playerState, position: $position}';
  }
}
