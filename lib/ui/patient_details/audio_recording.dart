import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/dictation_screen_bloc.dart';
import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/dictation_screen_state.dart';
import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/dictation_screen_event.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudioRecorderPopup extends StatefulWidget {
  @override
  _AudioRecorderPopupState createState() => new _AudioRecorderPopupState();
}

class _AudioRecorderPopupState extends State<AudioRecorderPopup> {
  LocalFileSystem localFileSystem;
  Recording _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  bool viewVisible = true;
  // var countdown;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.localFileSystem = localFileSystem ?? LocalFileSystem();
    if (mounted) {
      BlocProvider.of<AudioBloc>(context).add(InitRecord());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: SafeArea(
          child: _body(),
        ),
      ),
    );
  }

  _body() {
    return BlocListener<AudioBloc,AudioBlocState>(
      listener: (context, state) {
        print('BlocListener $state');
        _currentStatus = state.currentStatus;
        _current = state.current;
        viewVisible = state.viewVisible;
        if(state.errorMsg!=null && state.errorMsg.isNotEmpty){
          Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text(state.errorMsg ?? 'Something went wrong')));
        }
      },
      child: BlocBuilder<AudioBloc,AudioBlocState>(
        builder: (context, state) {
          print('BlocBuilder $state');

          return new Center(
            child: new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${_printDuration(_current?.duration)}"),
                        FlatButton(
                            onPressed: () async {
                              BlocProvider.of<AudioBloc>(context)
                                  .add(SaveRecord());
                            },
                            child: Text(
                              AppStrings.saveForLater,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomizedColors.saveLaterColor,
                                  fontSize: 18),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.lightBlue[50],
                          child: Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: viewVisible,
                            child: AudioWave(
                              height: 150,
                              width: 365,
                              spacing: 2.5,
                              bars: [
                                //Static wave
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 70, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 50, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 40, color: CustomizedColors.waveColor),
                                AudioWaveBar(
                                    height: 20, color: CustomizedColors.waveColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              switch (_currentStatus) {
                                case RecordingStatus.Initialized:
                                  {
                                    BlocProvider.of<AudioBloc>(context).add(StartRecord());
                                    break;
                                  }
                                case RecordingStatus.Recording:
                                  {
                                    BlocProvider.of<AudioBloc>(context).add(PauseRecord());
                                    break;
                                  }
                                case RecordingStatus.Paused:
                                  {
                                    BlocProvider.of<AudioBloc>(context).add(ResumeRecord());
                                    break;
                                  }
                                case RecordingStatus.Stopped:
                                  {
                                   BlocProvider.of<AudioBloc>(context).add(InitRecord());
                                    break;
                                  }
                                default:
                                  break;
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: CustomizedColors.waveColor,
                              child: _buildText(_currentStatus),
                              radius: 25,
                            ),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              //Upload audio popup
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Card(
                                    child: Container(
                                      height: 220,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.cloud_upload,
                                            size: 75,
                                            color: CustomizedColors.waveColor,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppStrings.dict,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    AppStrings.cancel,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: CustomizedColors.alertCancelColor),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: RaisedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    AppStrings.upload,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: CustomizedColors.textColor),
                                                  ),
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.cloud_upload,
                              size: 60,
                              color: CustomizedColors.waveColor,
                            )),
                        CircleAvatar(
                          backgroundColor: CustomizedColors.cicleAvatarBgColor,
                          child: GestureDetector(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 45,
                            ),
                            onTap: () {
                              BlocProvider.of<AudioBloc>(context).add(DeleteRecord());
                              print("Reset called");
                            },
                          ),
                          radius: 30,
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }

  /// timer format
  String _printDuration(Duration duration) {
    if(duration!=null){
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }
    return '';
  }

  ///play pause button icons
  Widget _buildText(RecordingStatus status) {
    var icon;
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          icon = Icons.not_started;
          break;
        }
      case RecordingStatus.Recording:
        {
          icon = Icons.pause;
          break;
        }
      case RecordingStatus.Paused:
        {
          icon = Icons.play_arrow;
          break;
        }
      case RecordingStatus.Stopped:
        {
          icon = Icons.stop_outlined;
          break;
        }
      default:
        break;
    }
    return Icon(
      icon,
      color: CustomizedColors.textColor,
      size: 30,
    );
  }
}