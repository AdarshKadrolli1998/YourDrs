import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:flutter/material.dart';

class DictationType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(AppStrings.textDictation)
          ),
          backgroundColor: CustomizedColors.appBarColor,
        ),
      ),
    );
  }
}
