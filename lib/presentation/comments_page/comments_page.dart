import 'package:flutter/material.dart';

import '../../assets/colors.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SocialMediaAppColors.white,
      body: const Center(
        child: Text('Comments Page'),
      ),
    );
  }
}
