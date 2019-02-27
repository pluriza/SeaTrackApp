import 'package:flutter/material.dart';
import 'package:mobile/shared/button/sea_button_type.dart';

class SeaButton extends StatefulWidget {

  final Icon buttonIcon;
  final SeaButtonType buttonType;
  final VoidCallback onClicked;
  final String title;
  
  final Color _buttonColor = Color.fromRGBO(247, 64, 106, 1.0);
  final EdgeInsets _buttonPadding = EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0);
  final RoundedRectangleBorder _buttonShape = RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0));

  SeaButton({
    @required this.buttonType,
    @required this.onClicked,
    @required this.title,
    this.buttonIcon
  });

  @override
  State<StatefulWidget> createState() {
    if (buttonType is SeaButtonRaisedType) { return SeaButtonRaised(); }
    if (buttonType is SeaButtonOutlineType) { return SeaButtonOutline(); }
    return null;
  }
}

class SeaButtonRaised extends State<SeaButton> {

  Color get _buttonColor => widget._buttonColor;
  Icon get _buttonIcon => widget.buttonIcon;
  EdgeInsets get _buttonPadding => widget._buttonPadding;
  RoundedRectangleBorder get _buttonShape => widget._buttonShape;
  VoidCallback get _onClicked => widget.onClicked;
  String get _title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: EdgeInsets.all(20.0),
      child: RaisedButton (
        onPressed: _onClicked,
        padding: _buttonPadding,
        shape: _buttonShape,
        color: _buttonColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: () sync* {
            if (_buttonIcon != null) {
              yield _buttonIcon;
            }
            yield Text (
                this._title,
                style: TextStyle (
                  color: Colors.white,
                  fontSize: 16.0,
                  letterSpacing: 0.3
                )          
            );
          } ().toList()
        )
      )
    );
  }
}

class SeaButtonOutline extends State<SeaButton> {

  Color get _buttonColor => widget._buttonColor;
  Icon get _buttonIcon => widget.buttonIcon;
  EdgeInsets get _buttonPadding => widget._buttonPadding;
  RoundedRectangleBorder get _buttonShape => widget._buttonShape;
  VoidCallback get _onClicked => widget.onClicked;
  String get _title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: EdgeInsets.all(20.0),
      child: OutlineButton (
        onPressed: _onClicked,
        padding: _buttonPadding,
        shape: _buttonShape,
        borderSide: BorderSide(color: _buttonColor, width: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: () sync* {
            if (_buttonIcon != null) {
              yield _buttonIcon;
            }
            Text (
              this._title,
              style: TextStyle (
                color: _buttonColor,
                fontSize: 16.0,
                letterSpacing: 0.3
              )
            );
          } ().toList()
        )
      )
    );
  }
}