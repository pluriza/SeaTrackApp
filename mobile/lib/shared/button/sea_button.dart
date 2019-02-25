import 'package:flutter/material.dart';

class SeaButton extends RaisedButton {

  final VoidCallback onClicked;
  final String title;

  SeaButton({@required this.title, @required this.onClicked})
    : super(onPressed: onClicked);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(),
      child: new Padding (
        padding: EdgeInsets.all(20.0),
        child: new Container(
          height: 45.0,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration (
            color: Color.fromRGBO(247, 64, 106, 1.0),
            borderRadius: new BorderRadius.all(Radius.circular(30.0)),
          ),
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