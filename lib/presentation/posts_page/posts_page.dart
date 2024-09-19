import 'package:flutter/material.dart';

import '../../assets/colors.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SocialMediaAppColors.white,
      body: const Center(
        child: Text('Posts Page'),
      ),
    );
  }
}
