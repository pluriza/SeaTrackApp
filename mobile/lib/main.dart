import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/pages/login/login_page.dart';
import 'package:core/src/networking/login_api.dart';
import 'package:core/src/blocs/authentication.dart';

void main() {
  runApp(App(loginApiProvider: LoginApiProvider()));
}

class App extends StatefulWidget {
  final LoginApiProvider loginApiProvider;

  App({Key key, @required this.loginApiProvider}) : super(key: key);

  @override
  State<App> createState() => _AppState();  
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;
  LoginApiProvider get loginApiProvider => widget.loginApiProvider;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc> (
      bloc: authenticationBloc,
      child: MaterialApp (
        home: BlocBuilder<AuthenticationEvent, AuthenticationState> (
          bloc: authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              // Splash page
              return LoginPage(loginApiProvider: loginApiProvider);
            }
            if (state is AuthenticationAuthenticated) {
              // Home page
              return LoginPage(loginApiProvider: loginApiProvider);
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(loginApiProvider: loginApiProvider);
            }
            if (state is AuthenticationLoading) {
              // Loading Indicator
              return LoginPage(loginApiProvider: loginApiProvider);
            }
          }
        )
      )
    );
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(loginApiProvider: loginApiProvider);
    authenticationBloc.dispatch(AppStarted());
    super.initState();
  }
}