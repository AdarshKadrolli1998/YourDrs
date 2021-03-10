import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation/dictations_model.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/dictations_list.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/patient_details.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/mic_button.dart';
import 'package:flutter/material.dart';

class DictationType extends StatefulWidget {
  @override
  _DictationTypeState createState() => _DictationTypeState();
}

class _DictationTypeState extends State<DictationType> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list = args['allDictation'];

    final Map args1 = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list1 = args1['allPreDictation'];

    final Map args2 = ModalRoute.of(context).settings.arguments;
    List<DictationItem> list2 = args2['myPreDictation'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.textDictation),
          backgroundColor: CustomizedColors.appBarColor,
        ),
        body: Builder(
          builder: (context)=>Container(
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
                        // if(list.length > 0){
                          Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DictationsList(),settings: RouteSettings(arguments: list)),
                              );
                        // }else{
                        //   Fluttertoast.showToast(
                        //       msg: "Record not found",
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.BOTTOM,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: CustomizedColors.toastColor,
                        //       textColor: CustomizedColors.textColor,
                        //       fontSize: 16.0
                        //   );
                          // Scaffold.of(context).showSnackBar(SnackBar(
                          //   content: Text("Record not found"),
                          //   duration: Duration(seconds: 1),
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.all(Radius.circular(50))
                          //   ),
                          // ));
                        // }
                          // list.length > 0 ?  Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => DictationsList(),settings: RouteSettings(arguments: list)),
                          // ) : () => null;
                      }
                    ),
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
                        if(list1.length > 0){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DictationsList(),settings: RouteSettings(arguments: list1)),
                          );
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Record not found"),
                            duration: Duration(seconds: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                          ));
                        }
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
                        if(list2.length > 0){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DictationsList(),settings: RouteSettings(arguments: list2)),
                          );
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Record not found"),
                            duration: Duration(seconds: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                          ));
                        }
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
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  void _incrementCounter() {
    setState(() {
      _isButtonDisabled = true;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("The App"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            _buildCounterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterButton() {
    return new RaisedButton(
      child: new Text(
        "fgd"
      ),
      onPressed: _isButtonDisabled ? null : _incrementCounter,
    );
  }
}