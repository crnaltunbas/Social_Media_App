import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/data/model/CommentModel/CommentModel.dart';
import 'package:social_media_app/data/repository/repositoryImpl.dart';
import '../../../data/datasource/network/ApiClient.dart';
import '../../../data/repository/CommentRepository/CommentRepository.dart';

class CommentController extends ChangeNotifier {
  late ApiClient apiClient;
  late Repository _repository;
  late http.Client client;
  init() async {
    client = http.Client();
    apiClient = ApiClient(httpClient: client);
    _repository = RepositoryImpl(apiClient) as Repository;
    await fetchComments();
  }

  List<CommentModel> _comments = [];
  bool isLoading = false;

  List<CommentModel> get todos => _comments;
  bool get loading => isLoading;

  Future<void> fetchComments() async {
    isLoading = true;
    notifyListeners();
    await _repository.getAllComments().then((value) {
      _comments = value;
      isLoading = false;
      notifyListeners();
      return value;
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });
  }
}
