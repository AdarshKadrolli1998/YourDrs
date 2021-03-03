import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_state.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

class AudioBlocState extends BaseBlocState {
  final String errorMsg;
  final Recording current;
  final RecordingStatus currentStatus;
  final bool viewVisible;
  final Duration duration;

  factory AudioBlocState.initial() => AudioBlocState(
    errorMsg: null,
    current: null,
    currentStatus: RecordingStatus.Unset,
    viewVisible: false,
    duration: null,
  );

  AudioBlocState reset() => AudioBlocState.initial();

  AudioBlocState({
    this.errorMsg,
    this.current,
    this.currentStatus,
    this.viewVisible,
    this.duration,
  });

  @override
  List<Object> get props => [
    this.errorMsg,
    this.current,
    this.currentStatus,
    this.viewVisible,
    this.duration,
  ];

  AudioBlocState copyWith({
    String errorMsg,
    Recording current,
    RecordingStatus currentStatus,
    bool viewVisible,
    Duration duration,
  }) {
    return new AudioBlocState(
      errorMsg: errorMsg ?? this.errorMsg,
      current: current ?? this.current,
      currentStatus: currentStatus ?? this.currentStatus,
      viewVisible: viewVisible ?? this.viewVisible,
      duration:duration ?? this.duration,
    );
  }

  @override
  String toString() {
    return 'AudioBlocState{errorMsg: $errorMsg, current: $current, currentStatus: $currentStatus, viewVisible: $viewVisible}';
  }
}
