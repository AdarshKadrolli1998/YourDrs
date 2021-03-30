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

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:open_file/open_file.dart';


class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  var _openResult = 'Unknown';
  Future<void> openFile() async {
    final filePath = '/storage/emulated/0/Download/file-sample_100kB.doc';
    final result = await OpenFile.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(
                child: Text('Tap to open file'),
                onPressed: openFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}