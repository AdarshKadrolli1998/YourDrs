import 'package:YOURDRS_FlutterAPP/blocs/dictation_screen/audio_dictation_bloc.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'audio_dictation.dart';
import 'dictation_type.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  bool isSwitched = false;
  var _currentSelectedValue;
  var _currencies = [
    "Surgery",
    "Non-Surgery",
    "MRI",
    "Operative",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.patientNameAppBar),
        backgroundColor: CustomizedColors.appBarColor,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 105,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              height: 90,
                              width: 90,
                              child: Image.network(
                                  "https://cdn1.vectorstock.com/i/thumb-large/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg")),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("02-12-2021",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("PC-MD"),
                          Text(
                            "Kevin Peterson\n(Male, 120)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Dictation Completed"),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Start File"),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightBlue[100],
                      activeColor: Colors.blue,
                      inactiveThumbColor: CustomizedColors.switchButtonColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Alert(
                          context: context,
                          title: "Select a Dictation Type",
                          content:  Container(
                              color: CustomizedColors.alertColor,
                              height: height * 0.09,
                              width: width * 0.65,
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),)),
                                    isEmpty: _currentSelectedValue == '',
                                    child: DropDown(
                                      value: _currentSelectedValue,
                                      hint: "Dictation Type",
                                      onChanged: (String newValue) {
                                        Navigator.pop(context);
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Card(
                                                child: Container(
                                                  height: 312,
                                                  child: BlocProvider<AudioDictationBloc>(
                                                    create: (context) => AudioDictationBloc(),
                                                    child: AudioDictation(),
                                                  ),
                                                )
                                            );
                                          },
                                        );
                                        setState(() {
                                          _currentSelectedValue = newValue;
                                          state.didChange(newValue);
                                          print(_currentSelectedValue);
                                        });
                                      },
                                      items: _currencies.map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              )
                          ),
                          buttons: [
                            DialogButton(
                              color: CustomizedColors.alertCancelColor,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: CustomizedColors.textColor,
                                    fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                        // Alert(
                        //   context: context,
                        //   title: "Select a Dictation Type",
                        //   content: Container(
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5),
                        //           color: CustomizedColors.alertColor),
                        //       margin: EdgeInsets.only(top: 10),
                        //       width: 230,
                        //       height: 50,
                        //       child: FormField<String>(
                        //         builder: (FormFieldState<String> state) {
                        //           return DropdownButtonHideUnderline(
                        //             child: DropdownButton<String>(
                        //               isExpanded: false,
                        //               hint: Text(
                        //                   "Dictation Type",
                        //                   style: TextStyle(
                        //                       color: CustomizedColors.textColor),textAlign: TextAlign.center,
                        //                 ),
                        //               value: _currentSelectedValue,
                        //               isDense: false,
                        //               onChanged: (String newValue) {
                        //                 Navigator.pop(context);
                        //                 showModalBottomSheet(
                        //                   context: context,
                        //                   builder: (BuildContext context) {
                        //                     return Card(
                        //                         child: Container(
                        //                           height: 312,
                        //                           child: BlocProvider<AudioDictationBloc>(
                        //                             create: (context) => AudioDictationBloc(),
                        //                             child: AudioDictation(),
                        //                           ),
                        //                         ));
                        //                   },
                        //                 );
                        //                 setState(() {
                        //                   _currentSelectedValue = newValue;
                        //                   state.didChange(newValue);
                        //                 });
                        //               },
                        //               items: _currencies.map((String value) {
                        //                 return DropdownMenuItem<String>(
                        //                   value: value,
                        //                   child: Text(value),
                        //                 );
                        //               }).toList(),
                        //             ),
                        //           );
                        //         },
                        //       )
                        //   ),
                        //   buttons: [
                        //     DialogButton(
                        //       color: CustomizedColors.alertCancelColor,
                        //       child: Text(
                        //         "Cancel",
                        //         style: TextStyle(
                        //             color: CustomizedColors.textColor,
                        //             fontSize: 20),
                        //       ),
                        //       onPressed: () => Navigator.pop(context),
                        //       width: 120,
                        //     )
                        //   ],
                        // ).show();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: CustomizedColors.circleAvatarColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DictationType(),),
                        );
                      //   final action = CupertinoActionSheet(
                      //     actions: [
                      //       CupertinoActionSheetAction(
                      //         child: Row(
                      //           children: [
                      //             Icon(Icons.camera_alt, color: Colors.blue),
                      //             Container(
                      //                 padding: EdgeInsets.only(left: 150),
                      //                 child: Text("Camera")),
                      //           ],
                      //         ),
                      //         onPressed: () {
                      //           print("Camera clicked");
                      //         },
                      //       ),
                      //       CupertinoActionSheetAction(
                      //         child: Row(
                      //           children: [
                      //             Icon(Icons.photo, color: Colors.blue),
                      //             Container(
                      //                 padding: EdgeInsets.only(left: 125),
                      //                 child: Text("Photo Library")),
                      //           ],
                      //         ),
                      //         onPressed: () {
                      //           print("Photo Library clicked");
                      //         },
                      //       )
                      //     ],
                      //     cancelButton: CupertinoActionSheetAction(
                      //       child: Text("Cancel"),
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //   );
                      //
                      //   showCupertinoModalPopup(
                      //       context: context, builder: (context) => action);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: CustomizedColors.circleAvatarColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("Date of Birth"),
                          trailing: Text("02-17-1992"),
                        ),
                        ListTile(
                          leading: Text("Case No."),
                          trailing: Text("Y210243271_1"),
                        ),
                        ListTile(
                          leading: Text("PC-MO"),
                          trailing: Text("Checked out"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  color: Color.fromRGBO(237, 243, 245, 1),
                  child: ListTile(
                    leading: Icon(
                      Icons.file_copy,
                      color: CustomizedColors.primaryColor,
                      size: 40,
                    ),
                    title: Text(
                      "Super Bill",
                      style: TextStyle(
                          color: CustomizedColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  color: Color.fromRGBO(237, 243, 245, 1),
                  child: ListTile(
                    leading: Icon(
                      Icons.file_copy,
                      color: CustomizedColors.primaryColor,
                      size: 40,
                    ),
                    title: Text(
                      "Super Bill",
                      style: TextStyle(
                          color: CustomizedColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(237, 243, 245, 1),
                  child: ListTile(
                    leading: Icon(
                      Icons.file_copy,
                      color: CustomizedColors.primaryColor,
                      size: 40,
                    ),
                    title: Text(
                      "Super Bill",
                      style: TextStyle(
                          color: CustomizedColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
