import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:via_cep/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getPost(String post) async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var jsonPost = jsonDecode(response.body);
      return (jsonPost as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
