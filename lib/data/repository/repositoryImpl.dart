
import 'dart:convert';

import 'package:social_media_app/data/model/todo_model/todo_model.dart';

import '../../domain/repository/repository.dart';
import '../datasource/network/ApiClient.dart';

class RepositoryImpl implements Repository {
  final ApiClient _apiClient;
  RepositoryImpl(this._apiClient);

  @override
  Future<List<TodoModel>> getAllTodos() async {
    final response = await _apiClient
        .get("todos");
    if (response!.statusCode == 200) {
      List jsonData = json.decode(response!.body);
      //Logger().i(jsonData);
      return jsonData.map((todo) => TodoModel.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }


}