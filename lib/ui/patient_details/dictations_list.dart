
import 'dart:io';
import 'dart:typed_data';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/model/dictation/dictations_model.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/play_audio.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/mic_button.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class DictationsList extends StatefulWidget {
  @override
  _DictationsListState createState() => _DictationsListState();
}

class _DictationsListState extends State<DictationsList> {
  PDFDocument document;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }
  loadDocument() async {
    document = await PDFDocument.fromURL('http://conorlastowka.com/book/CitationNeededBook-Sample.pdf');
  }
  convertDoc() async {
    http.Response response = await http.get(
      'https://file-examples-com.github.io/uploads/2017/02/file-sample_100kB.doc',
    );
    var _base64 = base64Encode(response.bodyBytes);
    print("byte converted $_base64");
    createPdf(_base64);
  }
  createPdf(String base64) async {
    var bytes = base64Decode(base64.replaceAll('\n', ''));
    Directory appDocDirectory;
    if (Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = await getExternalStorageDirectory();
    }
    final file = File("${appDocDirectory.path}/example1.doc");
    await file.writeAsBytes(bytes.buffer.asUint8List());
    print("file $file");
  }
  @override
  Widget build(BuildContext context) {
    final List<DictationItem> args = ModalRoute.of(context).settings.arguments;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.textDictation),
          backgroundColor: CustomizedColors.appBarColor,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20,
            vertical: MediaQuery.of(context).size.height / 50,
          ),
          child: ListView.builder(
            itemCount: args.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.textUploaded,
                          style: TextStyle(
                              color: CustomizedColors.uploadedTextColor,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: width * 0.045,
                        ),
                        Icon(
                          Icons.cloud_done,
                          size: 30,
                          color: CustomizedColors.dictationListIconColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              args[index].displayFileName ?? "",
                              style: TextStyle(fontSize: 16),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            // showDialog(context: context,
                            //     builder: (ctx) => AlertDialog(
                            //       insetPadding: EdgeInsets.symmetric( vertical: 70, horizontal: 10),
                            //       contentPadding: EdgeInsets.zero,
                            //       content: Container(
                            //         width: width * 80,
                            //         child: PDFViewer(
                            //         showNavigation: false,
                            //         showPicker: false,
                            //         scrollDirection: Axis.vertical,
                            //         document: document,
                            //         zoomSteps: 1,
                            //         ),
                            //       ),
                            //       actions: [
                            //         FlatButton(
                            //           child: Text('Close'),
                            //           onPressed: () {
                            //             Navigator.of(context, rootNavigator: true).pop();
                            //           },
                            //         ),
                            //       ],
                            //     )
                            // );
                            convertDoc();
                          },
                          icon: Icon(Icons.remove_red_eye,size: 30,),
                          color: CustomizedColors.dictationListIconColor,
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                      height: height * 0.55,
                                      child: Center(
                                        child: Container(
                                          height: height * 0.50,
                                          width: width * 0.90,
                                          child: ListView(
                                            children: [
                                              Column(
                                                children: [
                                                  PlayAudio(fileName: args[index].displayFileName),
                                                  MaterialButton(
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(fontSize: 18,color: CustomizedColors.textColor),
                                                    ),
                                                    color: CustomizedColors.raisedButtonColor,
                                                    shape: StadiumBorder(),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.play_circle_fill,size: 30,),
                          color: CustomizedColors.dictationListIconColor,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        /// calling the mic button widget from widget folder
        floatingActionButton: MicButton(),
      ),
    );
  }
}
