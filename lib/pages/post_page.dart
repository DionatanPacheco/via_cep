import 'package:flutter/material.dart';
import 'package:via_cep/model/post_model.dart';
import 'package:via_cep/repositories/post_repository.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var postRepository = PostRepository();
  var post = <PostModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    post = await postRepository.getPost(postRepository.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Post Page', style: TextStyle(color: Colors.white60)),
      ),
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: (_, index) {
          var posts = post[index];
          return ListTile(
            title: Text(
              posts.title,
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(posts.body),
          );
        },
      ),
    );
  }
}
