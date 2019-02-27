import 'package:equatable/equatable.dart';

abstract class SeaButtonType extends Equatable {}

class SeaButtonOutlineType extends SeaButtonType {
  @override
  String toString() => 'SeaButtonOutline';
}

class SeaButtonRaisedType extends SeaButtonType {
  @override
  String toString() => 'AuthenticationAuthenticated';
}