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
        userId = json['_id'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'token': token,
        'password': password,
        '_id': userId,
      };
}

class SeatrackSession {
  String token;
  String username;
  String userId;
  int role;

  SeatrackSession({this.token, this.username, this.userId, this.role});

  SeatrackSession.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    userId = json['_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'username': username,
    '_id': userId,
    'role': role,
  };
}
