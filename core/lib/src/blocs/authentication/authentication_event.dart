import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

// AppStarted will be dispatched when the application first loads.
class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

// LoggedIn will be dispatched on a successful login.
class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

// LoggedOut will be dispatched on a successful logout. 
class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}