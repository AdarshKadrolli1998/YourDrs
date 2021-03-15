// import 'dart:async';
// import 'package:YOURDRS_FlutterAPP/blocs/play_audio/play_audio_event.dart';
// import 'package:YOURDRS_FlutterAPP/blocs/play_audio/play_audio_state.dart';
// import 'package:YOURDRS_FlutterAPP/ui/patient_details/play_audio.dart';
// import 'package:audioplayer/audioplayer.dart';
// import 'package:bloc/bloc.dart';
//
// class PlayAudioBloc extends Bloc<PlayAudioEvent, PlayAudioState> {
//   AudioPlayer audioPlayer;
//   StreamSubscription _positionSubscription;
//   StreamSubscription _audioPlayerStateSubscription;
//   static const kUrl =
//       "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3";
//
//   PlayAudioBloc() : super(PlayAudioState.initial());
//   @override
//   Stream<PlayAudioState> mapEventToState(PlayAudioEvent event,) async* {
//     if (event is InitPlayer) {
//       yield* _initPlayer();
//     }
//     else if (event is StartPlayer) {
//       yield* _startAudio();
//     }
//     else if (event is PausePlayer) {
//       yield* _pauseAudio();
//     }
//     else if (event is StopPlayer) {
//       yield* _stopAudio();
//     }
//     else if (event is CompletePlayer) {
//       yield* _completeAudio();
//     }
//     else if (event is DisposePlayer){
//       yield* _disposePlayer();
//     }
//   }
//
//
//   Stream<PlayAudioState> _initPlayer() async*{
//     try {
//       audioPlayer = AudioPlayer();
//       _positionSubscription = audioPlayer.onAudioPositionChanged
//           .listen ((p) =>
//       state.copyWith(position: p)
//           // setState(() => position = p)
//       );
//       yield state;
//       _audioPlayerStateSubscription =
//           audioPlayer.onPlayerStateChanged.listen((s) async*{
//             if (s == AudioPlayerState.PLAYING) {
//               yield state.copyWith(duration: audioPlayer.duration);
//             } else if (s == AudioPlayerState.STOPPED) {
//               _completeAudio();
//               yield state.copyWith(position: state.duration);
//             }
//           }, onError: (msg) async* {
//             yield state.copyWith(playerState: PlayerState.stopped,duration: Duration(seconds: 0),position: Duration(seconds: 0),);
//           });
//     }catch (e) {
//       print(e);
//       yield state.copyWith(
//           errorMsg: e.toString()
//       );
//     }
//   }
//
//   Stream<PlayAudioState> _startAudio() async*{
//     try {
//       await audioPlayer.play(kUrl);
//       yield state.copyWith(playerState: PlayerState.playing);
//       // setState(() {
//       //   playerState = PlayerState.playing;
//       // });
//     }catch (e) {
//       print(e);
//       yield state.copyWith(
//           errorMsg: e.toString()
//       );
//     }
//   }
//
//   Stream<PlayAudioState> _pauseAudio() async*{
//     try {
//       await audioPlayer.pause();
//       yield state.copyWith(playerState: PlayerState.paused);
//       // setState(() => playerState = PlayerState.paused);
//     }catch (e) {
//       print(e);
//       yield state.copyWith(
//           errorMsg: e.toString()
//       );
//     }
//   }
//
//   Stream<PlayAudioState> _stopAudio() async*{
//     try{
//       await audioPlayer.stop();
//       yield state.copyWith(playerState: PlayerState.stopped, position: Duration());
//       // setState(() {
//       //   playerState = PlayerState.stopped;
//       //   position = Duration();
//       // });
//     }catch (e) {
//       print(e);
//       yield state.copyWith(
//           errorMsg: e.toString()
//       );
//     }
//   }
//
//   Stream<PlayAudioState> _completeAudio() async*{
//     try{
//       yield state.copyWith(playerState: PlayerState.stopped);
//       // setState(() => playerState = PlayerState.stopped);
//     }catch (e) {
//       print(e);
//       yield state.copyWith(
//           errorMsg: e.toString()
//       );
//     }
//   }
//
//   Stream<PlayAudioState> _disposePlayer() async*{
//     try{
//       _positionSubscription.cancel();
//       _audioPlayerStateSubscription.cancel();
//       audioPlayer.stop();
//     }catch (e) {
//       print(e);
//       yield state.copyWith(
//           errorMsg: e.toString()
//       );
//     }
//   }
//  }
