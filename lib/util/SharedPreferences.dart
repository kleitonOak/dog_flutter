import 'package:shared_preferences/shared_preferences.dart' as shared;

class SharedPreferences{
  static const String LOGIN_TOKEN = "login-token";
  
  static saveToken(String token) async{
    final prefs = await shared.SharedPreferences.getInstance();

    prefs.setString(LOGIN_TOKEN, token);
  }

  static Future<String> checkToken() async {
    final prefs = await shared.SharedPreferences.getInstance();
    return prefs.get(LOGIN_TOKEN);
  }

}