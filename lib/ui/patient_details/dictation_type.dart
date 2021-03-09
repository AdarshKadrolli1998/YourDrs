import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/dictations_model.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/dictations_list.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/mic_button.dart';
import 'package:flutter/material.dart';

class DictationType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list = args['allDictation'];

    final Map args1 = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list1 = args1['allPreDictation'];

    final Map args2 = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list2 = args2['myPreDictation'];
    // List aldata = List();
    // aldata = item.audioDictations;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(AppStrings.textDictation)
          ),
          backgroundColor: CustomizedColors.appBarColor,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// calling raised button class from the raised button widget folder
                  RaisedBtn(
                    text: AppStrings.textDictation,
                    count: list.length,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DictationsList(type: 1,),settings: RouteSettings(arguments: list)),
                        );
                      }
                  ),
                  // Text(aldata.length.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// calling raised button class from the raised button widget folder
                  RaisedBtn(
                    text: AppStrings.textAllDictation,
                    count: list1.length,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DictationsList(type: 2,),settings: RouteSettings(arguments: list1)),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// calling raised button class from the raised button widget folder
                  RaisedBtn(
                    text: AppStrings.textMyDictation,
                    count: list2.length,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DictationsList(type: 3,),settings: RouteSettings(arguments: list2)),
                      );
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 40
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// calling the mic button widget from widget folder
                    MicButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
