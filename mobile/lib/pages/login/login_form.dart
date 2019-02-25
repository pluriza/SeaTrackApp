import 'package:flutter/material.dart';
import 'package:mobile/shared/button/sea_button.dart';

class LoginForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form (
      child: Column (
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          new Padding (
            padding: EdgeInsets.all(20.0),
            child: new Padding (
                padding: EdgeInsets.all(20.0),
                child: Column (
                  children: <Widget> [
                    TextFormField (
                      decoration: InputDecoration (
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 0.3
                        )
                      ),
                      controller: _usernameController,
                    ),
                    TextFormField (
                      decoration: InputDecoration (
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 0.3
                        )
                      ),
                      controller: _passwordController,
                      obscureText: true
                    ),
                    SeaButton (
                      onClicked: _onLoginButtonPressed,
                      title:'Sign In'
                    )
                  ]
                )
              )
            )
        ]
      )
    );
  }

  _onLoginButtonPressed() {}
}