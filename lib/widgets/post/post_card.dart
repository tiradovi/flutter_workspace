import 'package:flutter/material.dart';
import 'package:project/widgets/post/post_image.dart';

import '../../models/Post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      PostImage(post:post),
      Divider(),
      ],
    );
  }
}
