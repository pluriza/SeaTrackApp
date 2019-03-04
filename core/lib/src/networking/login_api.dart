import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:core/src/networking/endpoints.dart';
import 'package:core/src/models/login_model.dart';

class LoginApiProvider {
  final String url = Endpoints.apiURL + Endpoints.settings['auth'];

  Future<dynamic> authenticate({
    @required String username,
    @required String password,
  }) async {
    final login = LoginModel(username, password);
    final body = json.encode(login.toJson());
    final headers = {"Content-type": "application/json"};
    print('Request to $url: ');
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers
      );
      return response;
    } on Error catch (e) {
      print('Server error; cause: $e');
      return null;
    }
  }
}


abstract class StorageProvider {
  /// Get/Load Token from LocalStorage or keychain/keystring.
  Future<String> hasToken(String pathOrKey);
  /// Set/Persist Token to LocalStorage or keychain/keystring.
  Future<void> persistToken(String pathOrKey, String payload);
  /// Delete Token from LocalStorage or keychain/keystring.
  Future<void> deleteToken(String pathOrKey);
}