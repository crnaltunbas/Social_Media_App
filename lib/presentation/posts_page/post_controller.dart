import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/datasource/network/ApiClient.dart';
import '../../data/model/posts_model/posts_model.dart';
import '../../data/repository/repositoryImpl.dart';
import '../../domain/repository/repository.dart';

class PostController extends ChangeNotifier {
  late ApiClient apiClient;
  late Repository _repository;
  late http.Client client;

  init() async {
    client = http.Client();
    apiClient = ApiClient(httpClient: client);
    _repository = RepositoryImpl(apiClient);
    await fetchPosts();
  }

  List<PostModel> _posts = [];
  bool isLoading = false;

  List<PostModel> get posts => _posts;

  bool get loading => isLoading;

  Future<void> fetchPosts() async {
    isLoading = true;
    notifyListeners();
    await _repository.getAllPosts().then((value) {
      _posts = value;
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });
  }
}
