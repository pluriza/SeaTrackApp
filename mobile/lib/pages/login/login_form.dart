import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/shared/button/sea_button.dart';
import 'package:core/src/blocs/login.dart';
import 'package:core/src/blocs/authentication.dart';

class LoginForm extends StatefulWidget {

  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc:_loginBloc,
      builder: (
        BuildContext context,
        LoginState state
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              )
            );
          });
        }

        return Form (
          child: Column (
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              new Padding (
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
                      buttonType: SeaButtonRaisedType(),
                      onClicked: _onLoginButtonPressed,
                      title:'Sign In'
                    )
                  ]
                )
              )
            ]
          )
        );
      }
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }


  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed (
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}