import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/widget/bottombar_widget.dart';

import 'main_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: BottomBarWidget(),
      ),
    );
  }
}
