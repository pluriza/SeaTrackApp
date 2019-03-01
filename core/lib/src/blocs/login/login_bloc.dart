import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core/src/models/login_model.dart';
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
      final response = await loginApiProvider.authenticate(
          username: event.username,
          password: event.password,
      );
      // Convert response into JSON Object
      final responseJson = json.decode(response.body);
      // Check Response Status Code
      if (response.statusCode == 200) {
        print('Success to retrieve data: $responseJson');
        // Convert responseJson to LoginModel and get the token.
        final token = LoginModel.fromJson(responseJson['user']).token;
        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } else {
        print('Failed to retrieve data: $responseJson');
        // Return the Login Failure with the request error.
        yield LoginFailure(error: responseJson['message']);
      }
    }
  }
}