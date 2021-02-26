import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class Audio {
  int id;
  Uint8List audioFile;

  Audio({this.id, @required this.audioFile});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'audioFile': audioFile,
    };
    return map;
  }

  Audio.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    audioFile = map['audioFile'];
  }
}
