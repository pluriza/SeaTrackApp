import 'package:flutter/material.dart';
import 'package:mobile/pages/login/login_page.dart';

void main() {
  runApp (
    MaterialApp(
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginPage()
      }
    )
  );
}