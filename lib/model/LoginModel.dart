class LoginModel{
  int id;
  String login;
  String password;
  String token;

  LoginModel({this.login, this.password});

  LoginModel.fromJson(Map<String, dynamic> jsonMap) :
    id = int.parse(jsonMap['id']),
    login = jsonMap['login'],
    token = jsonMap['token'];

  toJson() {
    return {
      'id': id,
      'login': login,
      'password': password,
      'token': token,
    };
  }

}