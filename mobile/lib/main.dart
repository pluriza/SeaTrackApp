import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/pages/login/login_page.dart';
import 'package:core/src/mock/user_repository.dart';
import 'package:core/src/blocs/authentication.dart';

void main() {
  runApp(App(userRepository: UserRepository()));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();  
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;
  UserRepository get userRepository => widget.userRepository;

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
              return LoginPage(userRepository: userRepository);
            }
            if (state is AuthenticationAuthenticated) {
              // Home page
              return LoginPage(userRepository: userRepository);
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: userRepository);
            }
            if (state is AuthenticationLoading) {
              // Loading Indicator
              return LoginPage(userRepository: userRepository);
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
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    authenticationBloc.dispatch(AppStarted());
    super.initState();
  }
}