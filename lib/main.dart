import 'package:YOURDRS_FlutterAPP/ui/patient_details/audio_recording.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/patient_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/dictation_screen/dictation_screen_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
       visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      // BlocProvider<AudioBloc>(
      //   create: (context) => AudioBloc(),
      //   child:
        PatientDetails(),
      // ),
    );
  }
}