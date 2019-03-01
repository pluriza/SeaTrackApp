import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:core/src/networking/endpoints.dart';
import 'package:core/src/models/login_model.dart';

class LoginApiProvider {
  final String url = Endpoints.apiURL + Endpoints.settings['auth'];

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    final login = LoginModel(username, password);
    final body = json.encode(login.toJson());
    final headers = {"Content-type": "application/json"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers
      );
      // Convert response into JSON Object
      final responseJson = json.decode(response.body);
      // Check Response Status Code
      if (response.statusCode == 200) {
        // Convert responseJson to LoginModel and get the token.
        final token = LoginModel.fromJson(responseJson).token;
        print('Success to retrieve data from $url: $responseJson');
        return token;
      } else {
        // Print a Error Message to the console.
        print('Failed to retrieve data from $url: $responseJson');
        return null;
      }
    } on Error catch (e) {
      print('Server error; cause: $e');
      return null;
    }
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
