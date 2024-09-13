import 'package:flutter/material.dart';

import '../../assets/colors.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SocialMediaAppColors.white,
      body: const Center(
        child: Text('Albums Page'),
      ),
    );
  }
}
