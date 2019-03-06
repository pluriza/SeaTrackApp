import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

// waiting to see if the user is authenticated or not on app start.
class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

// successfully authenticated.
class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

// not authenticated.
class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

// waiting to persist/delete a token
class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}