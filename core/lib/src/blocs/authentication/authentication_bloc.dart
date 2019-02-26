import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core/src/blocs/authentication.dart';
import 'package:core/src/networking/login_api.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginApiProvider loginApiProvider;

  AuthenticationBloc({@required this.loginApiProvider})
      : assert(loginApiProvider != null,
      'loginApiProvider missing at AuthBloc');

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  void onTransition(Transition transition) {
    print('Authentication Bloc Current State: ${transition.currentState}');
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationState currentState,
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final hasToken = await loginApiProvider.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await loginApiProvider.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await loginApiProvider.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}