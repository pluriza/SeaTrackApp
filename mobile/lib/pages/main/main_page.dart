import 'package:flutter/material.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:mobile/shared/splash/splash.dart';
import 'package:mobile/shared/app_bar/sea_app_bar.dart';

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  final _routes = {
    '/home': () => MaterialPageRoute(builder: (context) => SplashPage()),
    '/companies': () => MaterialPageRoute(
      builder: (context) => Center(
        child: Text('Test')
      )
    ),
    '/vessels': () => MaterialPageRoute(builder: (context) => SplashPage()),
    '/users': () => MaterialPageRoute(builder: (context) => SplashPage()),
    '/reports': () => MaterialPageRoute(builder: (context) => SplashPage()),
    '/': () => MaterialPageRoute(builder: (context) => SplashPage())
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: SeaAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context)
    );
  }

  MaterialApp _buildBody() {
    return new MaterialApp(onGenerateRoute: (route) => _routes[route.name]());
  }

  FlipBoxBar _buildBottomNavigationBar(context) {
    return new FlipBoxBar (
      items: [
        FlipBarItem(
            icon: Icon(Icons.home),
            text: Text("Home"),
            frontColor: Colors.blue[900],
            backColor: Colors.blueAccent),
          FlipBarItem(
            icon: Icon(Icons.business),
            text: Text("Companies"),
            frontColor: Colors.blue[800],
            backColor: Colors.blueAccent),
          FlipBarItem(
            icon: Icon(Icons.directions_boat),
            text: Text("Vessels"),
            frontColor: Colors.blue[700],
            backColor: Colors.blueAccent),
          FlipBarItem(
            icon: Icon(Icons.dashboard),
            text: Text("Users"),
            frontColor: Colors.blue[600],
            backColor: Colors.blueAccent),
          FlipBarItem(
            icon: Icon(Icons.trending_up),
            text: Text("Reports"),
            frontColor: Colors.blue,
            backColor: Colors.blueAccent)
      ],
      onIndexChanged: (newIndex) {
        if (_currentIndex != newIndex) {
          print(newIndex);
          print(_routes.keys.toList()[newIndex].substring(1));
          Navigator.of(context).pushNamed(_routes.keys.toList()[newIndex].substring(1));
          _currentIndex = newIndex;
        }
      }
    );
  }
}