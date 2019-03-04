class LoginModel {
  String username;
  String token;
  String password;
  int userId;

  LoginModel(this.username, this.password, [this.token, this.userId]);

  LoginModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        token = json['token'],
        password = json['password'],
        userId = json['pk'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'token': token,
        'password': password,
        'pk': userId,
      };
}

class SeatrackSession {
  String token;
  String username;
  int userId;

  SeatrackSession({this.token, this.username, this.userId});

  SeatrackSession.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'username': username,
    'userId': userId,
  };
}
