import 'package:flutter/material.dart';
import 'package:flip_box_bar/flip_box_bar.dart';

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Dashboard')
      ),
      body: Column(), //
      bottomNavigationBar: FlipBoxBar (
        items: [
          FlipBarItem(
              icon: Icon(Icons.dashboard),
              text: Text("Users"),
              frontColor: Colors.blue,
              backColor: Colors.blueAccent),
          FlipBarItem(
              icon: Icon(Icons.person),
              text: Text("Profile"),
              frontColor: Colors.cyan,
              backColor: Colors.cyanAccent)
        ],
        onIndexChanged: (newIndex) {
          print(newIndex);
        },
      )
    );
  }
}