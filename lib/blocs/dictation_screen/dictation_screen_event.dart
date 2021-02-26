import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_event.dart';

abstract class RecordingEvent extends BaseBlocEvent{}

//abstract class to find out which Event was occurred

class StartEvent extends RecordingEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// class ResumeEvent extends RecordingEvent{}
//
// class PauseEvent extends RecordingEvent{}
//
// class ResetEvent extends RecordingEvent{}
//
// class StopEvent extends RecordingEvent{}