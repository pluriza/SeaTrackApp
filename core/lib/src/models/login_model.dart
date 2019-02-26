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
