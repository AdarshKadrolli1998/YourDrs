import 'package:flutter/material.dart';

class SaveDictationsAlert extends StatelessWidget {
  String title;
  var clr;
  SaveDictationsAlert({@required this.title, @required this.clr});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Row(
          children: [
            Expanded(child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: clr),textAlign: TextAlign.center,)),
          ],
        ),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
