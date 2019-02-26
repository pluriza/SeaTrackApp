import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:core/src/mock/user_repository.dart';

import 'package:core/src/blocs/authentication.dart';
import 'package:core/src/blocs/login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null,
        'userRepository missing at LoginBloc'),
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

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        if (token != null) {
          authenticationBloc.dispatch(LoggedIn(token: token));
          yield LoginInitial();
        } else {
          yield LoginFailure(error: 'Invalid Token');
        }
      } on Exception catch(error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}