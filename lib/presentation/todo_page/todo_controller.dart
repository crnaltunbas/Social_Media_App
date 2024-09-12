import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/datasource/network/ApiClient.dart';
import '../../data/model/todo_model/todo_model.dart';
import '../../data/repository/repositoryImpl.dart';
import '../../domain/repository/repository.dart';

class TodoController extends ChangeNotifier {
  late ApiClient apiClient;
  late Repository _repository;
  late http.Client client;
  init() async {
    client = http.Client();
    apiClient = ApiClient(httpClient: client);
    _repository = RepositoryImpl(apiClient);
    await fetchTodos();
  }

  List<TodoModel> _todos = [];
  bool isLoading = false;

  List<TodoModel> get todos => _todos;
  bool get loading => isLoading;

  Future<void> fetchTodos() async {
    isLoading = true;
    notifyListeners();
    await _repository.getAllTodos().then((value) {
      _todos = value;
      isLoading = false;
      notifyListeners();
      return value;
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });

  }

}