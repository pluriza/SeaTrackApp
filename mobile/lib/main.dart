import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:mobile/services/storage_service.dart';
import 'package:mobile/pages/login/login_page.dart';
import 'package:mobile/pages/main/main_page.dart';
import 'package:mobile/shared/splash/splash.dart';

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

  bool _loadingAuthentication = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc> (
      bloc: authenticationBloc,
      child: MaterialApp (
        home: BlocBuilder<AuthenticationEvent, AuthenticationState> (
          bloc: authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              return MainPage();
            }
            if (state is AuthenticationUnauthenticated || state is AuthenticationLoading) {
              this._loadingAuthentication = state is AuthenticationLoading ? true : false;
              return ModalProgressHUD(
                child:LoginPage(loginApiProvider: loginApiProvider),
                inAsyncCall: this._loadingAuthentication,
                color: Colors.indigo,
              );
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
    authenticationBloc = AuthenticationBloc(storageProvider: new StorageService());
    authenticationBloc.dispatch(AppStarted());
    super.initState();
  }
}