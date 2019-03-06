import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:core/src/models/login_model.dart';

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
  final SeatrackSession data;

  LoggedIn({@required this.data}) : super([data]);

  @override
  String toString() => 'LoggedIn - data: $data';
}

// LoggedOut will be dispatched on a successful logout. 
class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}