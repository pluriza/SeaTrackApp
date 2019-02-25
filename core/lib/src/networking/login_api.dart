import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:core/src/networking/endpoints.dart';
import 'package:core/src/models/login_model.dart';

Future<LoginModel> requestLoginAPI(String username, String password) async {
  final url = Endpoints.apiURL;

  var body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(url, body: body);
  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print('Success to retrieve data from $url: $responseJson');
    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);
    print('Failed to retrieve data from $url: $responseJson');
    return null;
  }
}