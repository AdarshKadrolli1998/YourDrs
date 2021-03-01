

// import 'dart:async';
//
// import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc.dart';
// import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/dictation_screen_event.dart';
// import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
//
// import 'dictaion_screen_state.dart';
//
// class RecorderBloc extends BaseBloc<RecordingEvent, RecorderBlocState>{
//   RecorderBloc(): super(RecorderBlocState.initial());
//   FlutterAudioRecorder recorder;
//   Recording current;
//   RecordingStatus currentStatus;
//   bool viewVisible;
//   Timer timer;
//   @override
//   Stream<RecorderBlocState> mapEventToState(
//       RecordingEvent event) async* {
//     print("mapEventToState=$event");
//
//     if(event is StartEvent){
//       try {
//         await recorder.start();
//         var recording = await recorder.current(channel: 0);
//         // setState(() {
//           viewVisible = true;
//           current = recording;
//         // });
//
//         const tick = const Duration(milliseconds: 50);
//         timer = Timer.periodic(tick, (Timer t) async {
//           if (currentStatus == RecordingStatus.Stopped) {
//             t.cancel();
//           }
//
//           var current = await recorder.current(channel: 0);
//           // print(current.status);
//           // setState(() {
//             current = current;
//             currentStatus = current.status;
//           // });
//         });
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
// }



import 'dart:async';
import 'dart:io';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';

import 'dictation_screen_event.dart';

class RecorderBloc{
  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus _currentStatus;
  Timer _timer;
  bool _viewVisible = false;

  final _recorderStateController = StreamController<FlutterAudioRecorder>();

  StreamSink<FlutterAudioRecorder> get _inCounter =>_recorderStateController.sink;
  Stream<FlutterAudioRecorder> get counter =>_recorderStateController.stream;

  final _recorderEventController = StreamController<RecordingEvent>();
  Sink<RecordingEvent> get counterEventSink =>_recorderEventController.sink;

  RecorderBloc(){
    _recorderEventController.stream.listen((_mapEventToState));
  }

  init() async {
    String customPath = '/flutter_audio_recorder_';
    Directory appDocDirectory;
    // io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
    if (Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = await getExternalStorageDirectory();
    }
    // can add extension like ".mp4" ".wav" ".m4a" ".aac"
    customPath = appDocDirectory.path +
        customPath +
        DateTime.now().millisecondsSinceEpoch.toString()+".mp4";

    // .wav <---> AudioFormat.WAV
    // .mp4 .m4a .aac <---> AudioFormat.AAC
    // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
    _recorder =
        FlutterAudioRecorder(customPath, audioFormat: AudioFormat.AAC);

    await _recorder.initialized;
    // after initialization
    var current = await _recorder.current(channel: 0);
    print(current);
    // should be "Initialized", if all working fine
    // setState(() {
    // yield state.copyWith(current= current, currentStatus= currentStatus);

    _current = current;
    _currentStatus = current.status;
    print(_currentStatus);
    // });
  }
   _mapEventToState(RecordingEvent event) async {
    if(event is InitEvent){
     init();
    }else if(event is StartEvent){
      try {
        await _recorder.start();
        var recording = await _recorder.current(channel: 0);
        // setState(() {
          _viewVisible = true;
          _current = recording;
        // });

        const tick = const Duration(milliseconds: 50);
        _timer = Timer.periodic(tick, (Timer t) async {
          if (_currentStatus == RecordingStatus.Stopped) {
            t.cancel();
          }

          var current = await _recorder.current(channel: 0);
          // print(current.status);
          // setState(() {
            _current = current;
            _currentStatus = current.status;
          // });
        });
      } catch (e) {
        print(e);
      }
    }else if(event is ResetEvent){
      try {
        await _recorder.stop();
        var recording = await _recorder.current(channel: 0);
        print('${recording.status}');
        if (_timer.isActive) {
          _timer.cancel();
          _timer = null;
        }
        // setState(() {
        //   _currentStatus = recording.status;
        // });
        var result = await _recorder.stop();
        var res = await File(result.path).delete();
        print("Deleted $res");
        init();

        /*const tick = const Duration(milliseconds: 0);
       _timer = Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        setState(() {
          //_current = current;
          _timer.cancel();
          RecordingStatus.Unset;
        });
      });*/
      } catch (e) {
        print(e);
      }
    }else if (event is ResumeEvent){
      await _recorder.resume();
      // setState(() {
      _viewVisible = true;
      // });
      // yield state.copyWith(viewVisible= true);
    }else if(event is PauseEvent){
      await _recorder.pause();
      var recording = await _recorder.current(channel: 0);
      print('${recording.path}');
      // setState(() {
        _viewVisible = false;
      // });
      // yield state.copyWith(viewVisible= false);
    }
    // else if(event is StopEvent){
    //   var result = await recorder.stop();
    //   print("Stop recording: ${result.duration} ${result.path}");
    //   File file = widget.localFileSystem.file(result.path);
    //   print("File length: ${await file.length()}");
    //   // setState(() {
    //     viewVisible = false;
    //     current = result;
    //     currentStatus = current.status;
    //   // });
    //   /// converting the .mp4 file to byte format
    //   Uint8List bytes = file.readAsBytesSync();
    //   // print("byte converted--- $bytes");
    //   return ByteData.view(bytes.buffer);
    // }
  }

  void dispose(){
    _recorderStateController.close();
    _recorderEventController.close();
  }
}