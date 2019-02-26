import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/pages/login/login_form.dart';
import 'package:core/src/mock/user_repository.dart';
import 'package:core/src/blocs/login.dart';
import 'package:core/src/blocs/authentication.dart';

class LoginPage extends StatefulWidget {

  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
    : assert(userRepository != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc
    );
    super.initState();
  }
}