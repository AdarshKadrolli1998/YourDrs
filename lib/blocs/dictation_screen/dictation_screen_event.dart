import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_event.dart';

abstract class RecordingEvent{}

//abstract class to find out which Event was occurred

class InitEvent extends RecordingEvent{}

class StartEvent extends RecordingEvent{}

class ResumeEvent extends RecordingEvent{}

class PauseEvent extends RecordingEvent{}

class ResetEvent extends RecordingEvent{}

// class StopEvent extends RecordingEvent{}