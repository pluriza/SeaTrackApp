import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/src/models/login_model.dart';
import 'package:core/src/networking/login_api.dart';

class StorageService implements StorageProvider {

  SharedPreferences _prefs;

  @override
  Future<void> deleteToken(String pathOrKey) async {
    await getStorageInstance();
    _prefs.remove(pathOrKey);
  }

  @override
  Future<SeatrackSession> hasToken(String pathOrKey) async {
    await getStorageInstance();
    final String instance = _prefs.getString(pathOrKey);
    print('hasTokenInstance => $instance');
    try {
      final decodedData = json.decode(instance);
      final session = SeatrackSession.fromJson(decodedData);
      print('Session => ${session.toJson()}');
      return session;
    } catch (err) {
      print('err => $err');
      return SeatrackSession();
    }
  }

  @override
  Future<void> persistToken(String pathOrKey, SeatrackSession data) async {
    await getStorageInstance();
    final String instance = json.encode(data.toJson());
    print('Instance => $instance');
    _prefs.setString(pathOrKey, instance);
  }

  getStorageInstance() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

}