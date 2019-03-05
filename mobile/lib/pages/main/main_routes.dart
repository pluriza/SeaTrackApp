import 'package:flutter/material.dart';
import 'package:mobile/shared/splash/splash.dart';

final Map<String, dynamic> mainRoutes = {
  '/': (context) => SplashPage(),
  'users': (context) =>SplashPage(),
  'test': (context) => MaterialPageRoute(
    builder: (context) => Center(
      child: Text('Test')
    )
  )
};