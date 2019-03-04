import 'dart:convert';
import 'dart:html';
import 'package:core/core.dart';

class StorageService implements StorageProvider {

  @override
  Future<String> hasToken(String pathOrKey) async {
    var token = await window.localStorage[pathOrKey];
    print('Storage Service Has Token? ${token.isNotEmpty}');
    return token;
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
}