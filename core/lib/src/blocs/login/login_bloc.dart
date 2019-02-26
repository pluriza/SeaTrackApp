import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core/src/blocs/authentication.dart';
import 'package:core/src/blocs/login.dart';
import 'package:core/src/networking/login_api.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginApiProvider loginApiProvider;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.loginApiProvider,
    @required this.authenticationBloc,
  })  : assert(loginApiProvider != null,
        'loginApiProvider missing at LoginBloc'),
        assert(authenticationBloc != null, 
        'authenticationBloc missing at LoginBloc');

  @override
  LoginState get initialState => LoginInitial();

  @override
  void onTransition(Transition transition) {
    print('Login Bloc Current State: ${transition.currentState}');
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      final token = await loginApiProvider.authenticate(
          username: event.username,
          password: event.password,
      );
      if (token != null) {
        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Invalid Token');
        yield LoginInitial();
      }
    }
  }
}