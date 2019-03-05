import 'dart:convert';
import 'dart:html';
import 'package:core/core.dart';

class StorageService implements StorageProvider {

  @override
  Future<SeatrackSession> hasToken(String pathOrKey) async {
    var data = window.localStorage[pathOrKey];
    if (data == null) {
      return SeatrackSession();
    };
    var decodedData = SeatrackSession.fromJson(json.decode(data));
    return decodedData;
  }

  @override
  Future<void> persistToken(String pathOrKey, SeatrackSession payload) async {
    window.localStorage[pathOrKey] = json.encode(payload);
    return;
  }

  @override
  Future<void> deleteToken(String pathOrKey) async {
    window.localStorage.remove(pathOrKey);
    return;
  }

  SeatrackSession hasTokenSync(String pathOrKey) {
    var data = window.localStorage[pathOrKey];
    if (data == null) {
      return SeatrackSession();
    };
    var decodedData = SeatrackSession.fromJson(json.decode(data));
    return decodedData;
  }
}