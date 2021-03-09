import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:flutter/material.dart';

//stateless Widget for Common Raised Button
class RaisedButtons extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  RaisedButtons({@required this.text, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: CustomizedColors.signInButtonColor,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        padding: EdgeInsets.all(18.0),
        child: Text(
          text,
          style: TextStyle(
              color: CustomizedColors.signInButtonTextColor, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class RaisedBtn extends StatelessWidget {
  RaisedBtn(
      {@required this.text, @required this.onPressed, @required this.count});

  final String text;
  final int count;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 40
        ),
        width: width * 0.85,
        height: height * 0.11,
        child:RaisedButton(
            color: CustomizedColors.raisedBtnColor,
            onPressed: onPressed,
            child:  Text('$text ($count)',
              style: TextStyle(
                  color: CustomizedColors.materialButtonColor, fontSize: 20),
              textAlign: TextAlign.center,)
        )
    );
  }
}