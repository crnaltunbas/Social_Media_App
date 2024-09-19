import 'package:flutter/material.dart';

import '../../assets/colors.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
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
