import 'dart:io';

import 'package:dog_source/model/PostModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostRepository{
    Future<List<PostModel>> getPost() async{
      final String url = 'https://5db8d4e4177b350014ac7ea3.mockapi.io/api/v1/post';
      final http.Client endpoint = http.Client();
      var posts = new List<PostModel>();

     final response =  await endpoint.get(url,headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      // print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable list = json.decode(response.body);
        posts = list.map((model) => PostModel.fromJson(model)).toList();
          return posts;
      } else {
          throw Exception('Failed to load post');
      }   
    }
}