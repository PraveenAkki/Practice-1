import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_demo_app/models/post_models.dart';
import 'package:http/http.dart' as http;

class PostRepository {

  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel.fromJson(e);
        }).toList();
      }

    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception("Couldn't find the post");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Connection timeout");
    }

    throw Exception('Failed to load post');
  }
}
