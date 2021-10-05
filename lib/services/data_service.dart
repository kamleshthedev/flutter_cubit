import 'dart:convert';

import 'package:cubit_example/models/post_modal.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class DataService {
  final _baseURL = 'jsonplaceholder.typicode.com';

  Future<List<Post>> getPost() async {
    try {
      final url = Uri.http(_baseURL, '/posts');
      debugPrint(url.toString());
      final response = await http.get(url);
      final json = jsonDecode(response.body) as List;
      final post = json.map((postJson) => Post.fromJson(postJson)).toList();
      debugPrint(post.length.toString());
      return post;
    } catch (e) {
      rethrow;
    }
  }
}
