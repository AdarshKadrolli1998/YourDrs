import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/dictations_list.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/mic_button.dart';
import 'package:flutter/material.dart';

class DictationType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DictationsList(),),
                      );
                    },
                    text: AppStrings.textDictation,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// calling raised button class from the raised button widget folder
                  RaisedBtn(
                    onPressed: () {  },
                    text: AppStrings.textAllDictation,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// calling raised button class from the raised button widget folder
                  RaisedBtn(
                    onPressed: () {  },
                    text: AppStrings.textMyDictation,
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
