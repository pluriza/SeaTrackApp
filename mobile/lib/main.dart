import 'package:flutter/material.dart';
import 'package:mobile/pages/login/login_page.dart';

void main() {
  runApp (
    MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage()
      }
    )
  );
}