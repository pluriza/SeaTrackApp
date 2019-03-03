import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core/src/blocs/authentication.dart';
import 'package:core/src/networking/login_api.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final StorageProvider storageProvider;
  final String sessionStorageKey = 'seatrack_session';

  AuthenticationBloc({@required this.storageProvider})
      : assert(storageProvider != null,
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
      final hasToken = await storageProvider.hasToken(sessionStorageKey);

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await storageProvider.persistToken(sessionStorageKey, event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await storageProvider.deleteToken(sessionStorageKey);
      yield AuthenticationUnauthenticated();
    }
  }
}