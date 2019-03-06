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
  })  : assert(
            loginApiProvider != null,
            'The loginApiProvider argument'
            ' is missing at LoginBloc constructor'),
        assert(
            authenticationBloc != null,
            'The authenticationBloc argument'
            ' is missing at LoginBloc constructor');

  @override
  LoginState get initialState => LoginInitial();

  // @override
  // void onTransition(Transition transition) {
  //   print('Login Bloc Transition \n'
  //       'From ${transition.currentState} to ${transition.nextState} state');
  // }

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
        // print('Success to retrieve data: $responseJson');
        // Convert responseJson to SeatrackSession and get the token.
        final session = SeatrackSession.fromJson(responseJson['user']);
        authenticationBloc.dispatch(LoggedIn(data: session));
        yield LoginInitial();
      } else {
        // print('Failed to retrieve data: $responseJson');
        // Return the Login Failure with the request error.
        yield LoginFailure(error: responseJson['message']);
      }
    }
  }
}
