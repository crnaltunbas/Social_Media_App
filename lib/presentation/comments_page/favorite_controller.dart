import 'package:flutter/material.dart';
import 'package:social_media_app/data/model/CommentModel/CommentModel.dart';

class FavoriteController extends ChangeNotifier {
  final CommentModel comment;

  FavoriteController(this.comment);

  void toggleFavorite() {
    comment.isFavorite = !comment.isFavorite;
    if (comment.isFavorite) {
      comment.favoriteCount++;
    } else {
      comment.favoriteCount--;
    }
    notifyListeners();
  }
}
