import 'package:flutter/material.dart';
import 'package:social_media_app/assets/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Comments",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: SocialMediaAppColors.fourthColor,
                  fontSize: 24)
          ),
        ),
        body: ListTile(),
      ),
    );
  }
}
