// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:flutter/rendering.dart';
//
//
//
// class MyApp1 extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp1> {
//   bool _isLoading = true;
//   PDFDocument document;
//
//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }
//
//   loadDocument() async {
//     document = await PDFDocument.fromURL('http://conorlastowka.com/book/CitationNeededBook-Sample.pdf');
//
//     setState(() => _isLoading = false);
//   }
//
//   // changePDF(value) async {
//   //   setState(() => _isLoading = true);
//   //   if (value == 1) {
//   //     document = await PDFDocument.fromAsset('assets/sample2.pdf');
//   //   } else if (value == 2) {
//   //     document = await PDFDocument.fromURL(
//   //       "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf",
//   //       /* cacheManager: CacheManager(
//   //         Config(
//   //           "customCacheKey",
//   //           stalePeriod: const Duration(days: 2),
//   //           maxNrOfCacheObjects: 10,
//   //         ),
//   //       ), */
//   //     );
//   //   } else {
//   //     document = await PDFDocument.fromAsset('assets/sample.pdf');
//   //   }
//   //   setState(() => _isLoading = false);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           // drawer: Drawer(
//           //   child: Column(
//           //     children: <Widget>[
//           //       SizedBox(height: 36),
//           //       ListTile(
//           //         title: Text('Load from URL'),
//           //         onTap: () {
//           //           changePDF(2);
//           //         },
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           body: Center(
//             child: _isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : PDFViewer(
//               showNavigation: false,
//               showPicker: false,
//               scrollDirection: Axis.vertical,
//               document: document,
//               zoomSteps: 1,
//             ),
//           ),
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path/path.dart' as path;
//
//
// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final String _fileUrl = "https://file-examples-com.github.io/uploads/2017/02/file-sample_100kB.doc";
//   final String _fileName = "sample5.doc";
//   final Dio _dio = Dio();
//
//   String _progress = "-";
//
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   @override
//   void initState() {
//     super.initState();
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     final android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final iOS = IOSInitializationSettings();
//     final initSettings = InitializationSettings(android, iOS);
//
//     flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: _onSelectNotification);
//   }
//
//   Future<void> _onSelectNotification(String json) async {
//     final obj = jsonDecode(json);
//
//     if (obj['isSuccess']) {
//       OpenFile.open(obj['filePath']);
//     } else {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Error'),
//           content: Text('${obj['error']}'),
//         ),
//       );
//     }
//   }
//
//   Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
//     final android = AndroidNotificationDetails(
//         'channel id',
//         'channel name',
//         'channel description',
//         priority: Priority.High,
//         importance: Importance.Max
//     );
//     final iOS = IOSNotificationDetails();
//     final platform = NotificationDetails(android, iOS);
//     final json = jsonEncode(downloadStatus);
//     final isSuccess = downloadStatus['isSuccess'];
//
//     await flutterLocalNotificationsPlugin.show(
//         0, // notification id
//         isSuccess ? 'Success' : 'Failure',
//         isSuccess ? 'File has been downloaded successfully!' : 'There was an error while downloading the file.',
//         platform,
//         payload: json
//     );
//   }
//
//   Future<Directory> _getDownloadDirectory() async {
//     if (Platform.isAndroid) {
//       return await DownloadsPathProvider.downloadsDirectory;
//     }
//
//     // in this example we are using only Android and iOS so I can assume
//     // that you are not trying it for other platforms and the if statement
//     // for iOS is unnecessary
//
//     // iOS directory visible to user
//     return await getApplicationDocumentsDirectory();
//   }
//
//   Future<bool> _requestPermissions() async {
//     var permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
//
//     if (permission != PermissionStatus.granted) {
//       await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//       permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
//     }
//
//     return permission == PermissionStatus.granted;
//   }
//
//   void _onReceiveProgress(int received, int total) {
//     if (total != -1) {
//       setState(() {
//         _progress = (received / total * 100).toStringAsFixed(0) + "%";
//       });
//     }
//   }
//
//   Future<void> _startDownload(String savePath) async {
//     Map<String, dynamic> result = {
//       'isSuccess': false,
//       'filePath': null,
//       'error': null,
//     };
//
//     try {
//       final response = await _dio.download(
//           _fileUrl,
//           savePath,
//           onReceiveProgress: _onReceiveProgress
//       );
//       result['isSuccess'] = response.statusCode == 200;
//       result['filePath'] = savePath;
//     } catch (ex) {
//       result['error'] = ex.toString();
//     } finally {
//       await _showNotification(result);
//     }
//   }
//
//   Future<void> _download() async {
//     final dir = await _getDownloadDirectory();
//     final isPermissionStatusGranted = await _requestPermissions();
//
//     if (isPermissionStatusGranted) {
//       final savePath = path.join(dir.path, _fileName);
//       await _startDownload(savePath);
//     } else {
//       // handle the scenario when user declines the permissions
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Download progress:',
//             ),
//             Text(
//               '$_progress',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _download,
//         tooltip: 'Download',
//         child: Icon(Icons.file_download),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:open_file/open_file.dart';
//
//
// class MyApp1 extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp1> {
//   var _openResult = 'Unknown';
//   Future<void> openFile() async {
//     final filePath = '/storage/emulated/0/Download/CitationNeededBook-Sample.pdf';
//     final result = await OpenFile.open(filePath);
//
//     setState(() {
//       _openResult = "type=${result.type}  message=${result.message}";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('open result: $_openResult\n'),
//               TextButton(
//                 child: Text('Tap to open file'),
//                 onPressed: openFile,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:pdftron_flutter/pdftron_flutter.dart';
//
//
// class MyApp1 extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp1> {
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   // Platform messages are asynchronous, so we initialize via an async method.
//   Future<void> initPlatformState() async {
//       PdftronFlutter.openDocument("/storage/emulated/0/Download/CitationNeededBook-Sample.pdf");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('PDFTron flutter app'),
//         ),
//         body: Container(
//           // ignore: deprecated_member_use
//           child: RaisedButton(
//             child: Text("Click"),
//             onPressed: (){
//               // showDialog(context: context,
//               //     builder: (ctx) => AlertDialog(
//               //       insetPadding: EdgeInsets.symmetric( vertical: 70, horizontal: 10),
//               //       contentPadding: EdgeInsets.zero,
//               //       content: Container(
//               //         width: 80,
//               //         child: PDFViewer(
//               //         showNavigation: false,
//               //         showPicker: false,
//               //         scrollDirection: Axis.vertical,
//               //         document: document,
//               //         zoomSteps: 1,
//               //         ),
//               //       ),
//               //       actions: [
//               //         FlatButton(
//               //           child: Text('Close'),
//               //           onPressed: () {
//               //             Navigator.of(context, rootNavigator: true).pop();
//               //           },
//               //         ),
//               //       ],
//               //     )
//               // );
//               initPlatformState();
//             },
//           ),
//         )
//       ),
//     );
//   }
// }

// import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
//
// class ChewieDemo extends StatefulWidget {
//   ChewieDemo({this.title = 'Chewie Demo'});
//
//   final String title;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }
//
// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform _platform;
//   VideoPlayerController _videoPlayerController1;
//   VideoPlayerController _videoPlayerController2;
//   ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController1 = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
//     _videoPlayerController2 = VideoPlayerController.asset(
//         'assets/videos/sample.mp4');
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       aspectRatio: 3 / 2,
//       autoPlay: false,
//       looping: true,
//       // Try playing around with some of these other options:
//
//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title,
//       theme: ThemeData.light().copyWith(
//         platform: _platform ?? Theme.of(context).platform,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: Chewie(
//                   controller: _chewieController,
//                 ),
//               ),
//             ),
//             // FlatButton(
//             //   onPressed: () {
//             //     _chewieController.enterFullScreen();
//             //   },
//             //   child: Text('Fullscreen'),
//             // ),
//             // Row(
//             //   children: <Widget>[
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _chewieController.dispose();
//             //             /*_videoPlayerController2.pause();
//             //             _videoPlayerController2.seekTo(Duration(seconds: 0));*/
//             //
//             //             _chewieController = ChewieController(
//             //               videoPlayerController: _videoPlayerController1,
//             //               aspectRatio: 3 / 2,
//             //               autoPlay: false,
//             //               looping: true,
//             //             );
//             //
//             //             _videoPlayerController1..initialize().then((_){
//             //               setState(() {
//             //                 _videoPlayerController1.seekTo(Duration(seconds: 3));
//             //                 _videoPlayerController1.play();
//             //               });
//             //             });
//             //
//             //           });
//             //         },
//             //         child: Padding(
//             //           child: Text("Seek To"),
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _chewieController.dispose();
//             //             _videoPlayerController2.pause();
//             //             _videoPlayerController2.seekTo(Duration(seconds: 0));
//             //             _chewieController = ChewieController(
//             //               videoPlayerController: _videoPlayerController1,
//             //               aspectRatio: 3 / 2,
//             //               autoPlay: true,
//             //               looping: true,
//             //             );
//             //           });
//             //         },
//             //         child: Padding(
//             //           child: Text("Video 1"),
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _chewieController.dispose();
//             //             _videoPlayerController1.pause();
//             //             _videoPlayerController1.seekTo(Duration(seconds: 0));
//             //             _chewieController = ChewieController(
//             //               videoPlayerController: _videoPlayerController2,
//             //               aspectRatio: 3 / 2,
//             //               autoPlay: true,
//             //               looping: true,
//             //             );
//             //           });
//             //         },
//             //         child: Padding(
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //           child: Text("Video 2"),
//             //         ),
//             //       ),
//             //     )
//             //   ],
//             // ),
//             // Row(
//             //   children: <Widget>[
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _platform = TargetPlatform.android;
//             //           });
//             //         },
//             //         child: Padding(
//             //           child: Text("Android controls"),
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _platform = TargetPlatform.iOS;
//             //           });
//             //         },
//             //         child: Padding(
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //           child: Text("iOS controls"),
//             //         ),
//             //       ),
//             //     )
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}