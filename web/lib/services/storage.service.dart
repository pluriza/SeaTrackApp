import 'dart:html';
import 'package:core/core.dart';

class StorageService implements StorageProvider {

  @override
  Future<bool> hasToken(String pathOrKey) async {
    var token = await window.localStorage[pathOrKey].isNotEmpty;
    print('Has Token: $token');
    return token;
  }

  @override
  Future<void> persistToken(String pathOrKey, String payload) async {
    window.localStorage[pathOrKey] = payload;
    return;
  }

  @override
  Future<void> deleteToken(String pathOrKey) async {
    window.localStorage.remove(pathOrKey);
    return;
  }
}