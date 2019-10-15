import 'dart:io';

import 'package:dog_source/model/LoginModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository{
    Future<LoginModel> getAccess(String user, String password) async{
      final String url = 'https://5d817f721c8ff70014ef3d04.mockapi.io/api/v1/login';
      final http.Client endpoint = http.Client();

     final response =  await endpoint.post(url,headers: {HttpHeaders.contentTypeHeader: 'application/json'},body: json.encode(LoginModel(login: user, password: password)));
      // print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
          return LoginModel.fromJson(json.decode(response.body));
      } else {
          throw Exception('Failed to load post');
      }   
    }

    Future<bool> getToken(String user) async{
        return false;
    }
}