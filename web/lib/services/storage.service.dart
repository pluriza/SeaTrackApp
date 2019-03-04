import 'dart:convert';
import 'dart:html';
import 'package:core/core.dart';

class StorageService implements StorageProvider {

  @override
  Future<SeatrackSession> hasToken(String pathOrKey) async {
    var data = await window.localStorage[pathOrKey];
    var decodedData = SeatrackSession.fromJson(json.decode(data));
    print('Storage Service Has Token? ${decodedData.token.isNotEmpty}');
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
}