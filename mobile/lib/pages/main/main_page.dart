import 'package:flutter/material.dart';
import 'package:flip_box_bar/flip_box_bar.dart';

import 'package:mobile/shared/app_bar/sea_app_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  final _mainPages = [
    Scaffold(
      body: Text('Home page')
    ),
    Scaffold(
      body: Text('Companies page')
    ),
    Scaffold(
      body: Text('Vessels page')
    ),
    Scaffold(
      body: Text('Users page')
    ),
    Scaffold(
      body: Text('Reports page')
    )
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: SeaAppBar(),
      body: _mainPages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(context)
    );
  }

  void _onSelectNavBar(newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  FlipBoxBar _buildBottomNavigationBar(context) {
    return new FlipBoxBar (
      items: [
        FlipBarItem(
          icon: Icon(Icons.home),
          text: Text("Home"),
          frontColor: Colors.blue[900],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.business),
          text: Text("Companies"),
          frontColor: Colors.blue[800],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.directions_boat),
          text: Text("Vessels"),
          frontColor: Colors.blue[700],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.dashboard),
          text: Text("Users"),
          frontColor: Colors.blue[600],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.trending_up),
          text: Text("Reports"),
          frontColor: Colors.blue,
          backColor: Colors.blueAccent
        )
      ],
      onIndexChanged: _onSelectNavBar
    );
  }
}