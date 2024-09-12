import 'package:flutter/material.dart';

import '../todo_page/todo_page.dart';
//burada enumdaki sayfa sıralarıyla app page listesindeki sayfa sıraları aynı olmalı
//ona göre ayarlamalar yapınız lütfen
List<Widget> appPages = [
  TodoPage(),
];

enum AppPageType {
  UserPage,
  PostPage,
  TodoPage,
}

List<String> appPageNames = [
  "User Page",
  "Post Page",
  "Todo Page",
];