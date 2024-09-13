import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/datasource/network/ApiClient.dart';
import '../../data/model/comments_model/comments_model.dart';
import '../../data/repository/repositoryImpl.dart';

class CommentController extends ChangeNotifier {
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
      _errorMessage = null ;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}