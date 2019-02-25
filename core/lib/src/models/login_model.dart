class LoginModel {
  final String username;
  final String token;
  final String password;
  final int userId;

  LoginModel(this.username, this.token, this.password, this.userId);

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
