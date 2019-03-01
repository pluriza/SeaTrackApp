import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/pages/login/login_form.dart';
import 'package:core/src/networking/login_api.dart';
import 'package:core/src/blocs/login.dart';
import 'package:core/src/blocs/authentication.dart';

class LoginPage extends StatefulWidget {

  final LoginApiProvider loginApiProvider;

  LoginPage({Key key, @required this.loginApiProvider})
    : assert(loginApiProvider != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  LoginApiProvider get _loginApiProvider => widget.loginApiProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login')
      ),
      body: LoginForm(
        authenticationBloc: _authenticationBloc,
        loginBloc: _loginBloc
      )
    );
  }

  @override
  void dispose(){
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      loginApiProvider: _loginApiProvider,
      authenticationBloc: _authenticationBloc
    );
    super.initState();
  }
}