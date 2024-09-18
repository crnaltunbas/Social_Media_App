import 'package:flutter/material.dart';
import '../albums_page/albums_page.dart';
import '../comments_page/comment_page.dart';
import '../photos_page/photos_page.dart';
import '../posts_page/posts_page.dart';
import '../todo_page/todo_page.dart';
import '../user_page/user_page.dart';

enum AppPageType {
  postsPage(
    title: "Posts",
    icon: Icons.home_filled, // İkon burada belirleniyor
    page: PostsPage(),
  ),
  commentsPage(
    title: "Comments",
    icon: Icons.comment,
    page: CommentsPage(),
  ),
  albumsPage(
    title: "Albums",
    icon: Icons.camera,
    page: AlbumsPage(),
  ),
  photosPage(
    title: "Photos",
    icon: Icons.photo,
    page: PhotosPage(),
  ),
  todoPage(
    title: "Todos",
    icon: Icons.check_circle,
    page: TodoPage(),
  ),
  userPage(
    title: "Users",
    icon: Icons.person,
    page: UserPage(),
  );

  final String title;
  final IconData icon;
  final Widget page;

  const AppPageType({
    required this.title,
    required this.icon,
    required this.page,
  });
}
