import 'package:flutter/material.dart';

class SeaButton extends StatelessWidget {

  final VoidCallback onClicked;
  final String title;

  SeaButton({@required this.title, @required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: EdgeInsets.all(20.0),
      child: RaisedButton (
        onPressed: onClicked,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        color: Color.fromRGBO(247, 64, 106, 1.0),
        child: new Container (
          height: 45.0,
          alignment: FractionalOffset.center,
          child: new Text (
            this.title,
            style: new TextStyle (
              color: Colors.white,
              fontSize: 16.0,
              letterSpacing: 0.3
            )
          )
        )
      )
    );
  }
}