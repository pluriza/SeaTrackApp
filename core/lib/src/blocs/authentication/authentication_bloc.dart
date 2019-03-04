import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core/src/blocs/authentication.dart';
import 'package:core/src/networking/login_api.dart';
import 'package:core/src/networking/endpoints.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final StorageProvider storageProvider;

  AuthenticationBloc({@required this.storageProvider})
      : assert(
            storageProvider != null,
            'The "storageProvider" argument'
            'is missing at AuthenticationBloc constructor');

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  void onTransition(Transition transition) {
    print('Authentication Bloc Transition \n'
        'From ${transition.currentState} to ${transition.nextState} state');
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationState currentState,
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final hasToken =
          await storageProvider.hasToken(Endpoints.sessionStorageKey);

      if (hasToken.isNotEmpty) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await storageProvider.persistToken(
          Endpoints.sessionStorageKey, event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await storageProvider.deleteToken(Endpoints.sessionStorageKey);
      yield AuthenticationUnauthenticated();
    }
  }
}
