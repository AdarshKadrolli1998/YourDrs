import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_state.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

class RecorderBlocState{
FlutterAudioRecorder recorder;
Recording current;
RecordingStatus currentStatus;
bool viewVisible;

factory RecorderBlocState.initial() => RecorderBlocState(
  recorder: null,
  current:null,
  currentStatus: RecordingStatus.Unset,
  viewVisible:false,
);
RecorderBlocState reset() => RecorderBlocState.initial();

RecorderBlocState({
  this.viewVisible,
  this.currentStatus,
  this.current,
  this.recorder,
});

@override
  List<Object>get props =>
    [this.viewVisible,
      this.currentStatus,
      this.current,
      this.recorder];

RecorderBlocState copyWith({
  bool viewVisible,
  FlutterAudioRecorder recorder,
  Recording current,
  RecordingStatus currentStatus,
}){
  return new RecorderBlocState(
    viewVisible: viewVisible ?? this.viewVisible,
    recorder: recorder ?? this.recorder,
    current: current ?? this.current,
    currentStatus: currentStatus ?? this.currentStatus,
  );
}

@override
  String toString(){
  return 'RecorderBlocState{viewVisible: $viewVisible, recorder: $recorder, current: $current, currentStatus: $currentStatus}';
}
}