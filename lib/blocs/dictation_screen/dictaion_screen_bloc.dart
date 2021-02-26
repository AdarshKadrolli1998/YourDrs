

import 'dart:async';

import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc.dart';
import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/dictation_screen_event.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

import 'dictaion_screen_state.dart';

class RecorderBloc extends BaseBloc<RecordingEvent, RecorderBlocState>{
  RecorderBloc(): super(RecorderBlocState.initial());
  FlutterAudioRecorder recorder;
  Recording current;
  RecordingStatus currentStatus;
  bool viewVisible;
  Timer timer;
  @override
  Stream<RecorderBlocState> mapEventToState(
      RecordingEvent event) async* {
    print("mapEventToState=$event");

    if(event is StartEvent){
      try {
        await recorder.start();
        var recording = await recorder.current(channel: 0);
        // setState(() {
          viewVisible = true;
          current = recording;
        // });

        const tick = const Duration(milliseconds: 50);
        timer = Timer.periodic(tick, (Timer t) async {
          if (currentStatus == RecordingStatus.Stopped) {
            t.cancel();
          }

          var current = await recorder.current(channel: 0);
          // print(current.status);
          // setState(() {
            current = current;
            currentStatus = current.status;
          // });
        });
      } catch (e) {
        print(e);
      }
    }
  }
}










//
// import 'dart:async';
//
// import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
//
// import 'dictation_screen_event.dart';
//
// class BlocRecorder{
//   FlutterAudioRecorder _recorder;
//   // Timer _timer;
//   bool viewVisible = false;
//   final _recorderStateController = StreamController<FlutterAudioRecorder>();
//
//   StreamSink<FlutterAudioRecorder> get _inCounter =>_recorderStateController.sink;
//   Stream<FlutterAudioRecorder> get counter =>_recorderStateController.stream;
//
//   final _recorderEventController = StreamController<EventCounter>();
//   Sink<EventCounter> get counterEventSink =>_recorderEventController.sink;
//
//   BlocCounter(){
//     _recorderEventController.stream.listen((_mapEventToState));
//   }
//
//   Future<void> _mapEventToState(EventCounter event) async {
//     await _recorder.resume();
//     // setState(() {
//     //   viewVisible = true;
//     // });
//   }
//
//   void dispose(){
//     _recorderStateController.close();
//     _recorderEventController.close();
//   }
// }