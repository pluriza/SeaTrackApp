import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/src/models/login_model.dart';
import 'package:core/src/networking/login_api.dart';

class StorageService implements StorageProvider {
  
  @override
  Future<void> deleteToken(String pathOrKey) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(pathOrKey);
  }

  @override
  Future<String> hasToken(String pathOrKey) async {
    final prefs = await SharedPreferences.getInstance();
    final String instance = prefs.getString(pathOrKey);
    print('hasTokenInstance => $instance');
    try {
      final session = json.decode(instance);
      print('Session => $session');
      return session['token'];
    } catch (err) {
      print('err => $err');
      return '';
    }
  }

  @override
  Future<void> persistToken(String pathOrKey, SeatrackSession data) async {
    final prefs = await SharedPreferences.getInstance();
    final String instance = json.encode(data.toJson());
    print('Instance => $instance');
    prefs.setString(pathOrKey, instance);
  }

}