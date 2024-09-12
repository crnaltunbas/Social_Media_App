import 'package:social_media_app/data/model/CommentModel/CommentModel.dart';

abstract class Repository {
  Future<List<CommentModel>> getAllComments();
}
