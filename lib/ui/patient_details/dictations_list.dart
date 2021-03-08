import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/all_dictation_model.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/all_previous_dictation_model.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/my_previous_dictation_model.dart';
import 'package:YOURDRS_FlutterAPP/network/services/dictation/dictation_services.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/audio_player.dart';
import 'package:YOURDRS_FlutterAPP/widget/mic_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DictationsList extends StatefulWidget {
  @override
  _DictationsListState createState() => _DictationsListState();
}

class _DictationsListState extends State<DictationsList> {
  List data = List();
  AllDictationService apiServices1 = AllDictationService();

  // AllPreviousDictationService apiServices2 = AllPreviousDictationService();

  // MyPreviousDictationService apiServices3 = MyPreviousDictationService();

  void didChangeDependencies() async{
    super.didChangeDependencies();

    AllDictations allDictations = await apiServices1.getDictations();
    // print('allDictations--> $allDictations');
    data = allDictations.audioDictations;
    // print(data[1].id);
    // AllPreviousDictations allPreviousDictations = await apiServices2.getAllPreviousDictations();
    // print('allPreviousDictations--> $allPreviousDictations');
    //
    // MyPreviousDictations myPreviousDictations = await apiServices3.getMyPreviousDictations();
    // print('myPreviousDictations--> $myPreviousDictations');
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text(AppStrings.textDictation)),
          backgroundColor: CustomizedColors.appBarColor,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20,
            vertical: MediaQuery.of(context).size.height / 50,
          ),
          child: ListView.builder(
            itemCount: data.length,
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
                              data[index].displayFileName,
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 30,
                          color: CustomizedColors.dictationListIconColor,
                        ),
                        SizedBox(
                          width: width * 0.045,
                        ),
                        Icon(
                          Icons.play_circle_fill,
                          size: 30,
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
              // Divider(
              //   thickness: 1,
              // ),
              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Text(
              //             AppStrings.textUploaded,
              //             style: TextStyle(
              //                 color: CustomizedColors.uploadedTextColor,
              //                 fontSize: 16),
              //           ),
              //           SizedBox(
              //             width: width * 0.045,
              //           ),
              //           Icon(
              //             Icons.cloud_done,
              //             size: 30,
              //             color: CustomizedColors.dictationListIconColor,
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: height * 0.020,
              //       ),
              //       Row(
              //         children: [
              //           Expanded(
              //               child: Text(
              //             'MR_hareesh_Y201243120_1_20210217_637496828593768180',
              //             style: TextStyle(fontSize: 16),
              //           )),
              //         ],
              //       ),
              //       SizedBox(
              //         height: height * 0.020,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Icon(
              //             Icons.remove_red_eye,
              //             size: 30,
              //             color: CustomizedColors.dictationListIconColor,
              //           ),
              //           SizedBox(
              //             width: width * 0.045,
              //           ),
              //           Icon(
              //             Icons.play_circle_fill,
              //             size: 30,
              //             color: CustomizedColors.dictationListIconColor,
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              // Divider(
              //   thickness: 1,
              // ),
          ),
        ),
        /// calling the mic button widget from widget folder
        floatingActionButton: MicButton(),
      ),
    );
  }
}
