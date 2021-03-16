import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/dictation_type.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/mic_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/network/model/dictation/dictations_model.dart';
import 'package:YOURDRS_FlutterAPP/network/services/dictation/dictation_services.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  bool isSwitched = false;

  List allDtion = List();
  List allPrevDtion = List();
  List myPrevDtion = List();

  // ignore: non_constant_identifier_names
  AllDtion() async{
    AllDictationService apiServices1 = AllDictationService();
    Dictations allDictations = await apiServices1.getDictations();
    // print('allDictations--> $allDictations');
    allDtion = allDictations.audioDictations;
  }

  // ignore: non_constant_identifier_names
  AllPrevDtion() async{
    AllPreviousDictationService apiServices2 = AllPreviousDictationService();
    Dictations allPreviousDictations = await apiServices2.getAllPreviousDictations();
    allPrevDtion = allPreviousDictations.audioDictations;
  }

  // ignore: non_constant_identifier_names
  MyPrevDtion() async{
    MyPreviousDictationService apiServices3 = MyPreviousDictationService();
    Dictations myPreviousDictations = await apiServices3.getMyPreviousDictations();
    myPrevDtion = myPreviousDictations.audioDictations;
  }
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
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
                      // isLoading?FractionalTranslation(
                      //   translation: Offset(0.0,4.0),
                      //   child: Center(
                      //     child: CircularProgressIndicator(),
                      //   ),
                      // ):
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
                      /// calling the mic button widget from widget folder
                      MicButton(),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () async {
                          setState(() {
                            isLoading=true;
                          });
                          await AllDtion();
                          await AllPrevDtion();
                          await MyPrevDtion();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DictationType(),settings: RouteSettings(arguments: {'allDictation':allDtion, 'allPreDictation': allPrevDtion, 'myPreDictation': myPrevDtion})),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MyApp1()),
                          // );

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
        )
    );
  }
}
