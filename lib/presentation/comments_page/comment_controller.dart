import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/data/model/CommentModel/CommentModel.dart';
import 'package:social_media_app/data/repository/repositoryImpl.dart';
import '../../../data/datasource/network/ApiClient.dart';
import 'favorite_controller.dart';




class CommentController extends ChangeNotifier {
  List<FavoriteController> favoriteControllers = [];
  late ApiClient apiClient;
  late RepositoryImpl repositoryImpl;
  late http.Client client;
  init() async {
    client = http.Client();
    apiClient = ApiClient(httpClient: client);
    repositoryImpl = RepositoryImpl(apiClient);
    await getAllComments();
  }

  List<CommentModel> _comments = [];
  bool isLoading = false;
  String? _errorMessage;

  List<CommentModel> get comments => _comments;
  bool get loading => isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getAllComments() async {
    isLoading = true;
    notifyListeners();

    try {
      _comments = await repositoryImpl.getAllComments();
      favoriteControllers = _comments.map((comment) => FavoriteController(comment)).toList();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  void toggleFavorite(int index) {
    favoriteControllers[index].toggleFavorite();
    notifyListeners();  // UI'yı güncellemek için
  }
}
