import 'package:flutter/material.dart';
import 'package:project/models/Post.dart';
import 'package:project/services/post_service.dart';
import 'package:project/widgets/post/post_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> posts = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  void loadPosts() async {
    try {
      var data = await Postservice.getPosts();
      setState(() {
        posts = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('오류 : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            ),
    );
  }
}
