import 'dart:convert';

import 'package:social_media_app/data/datasource/network/ApiClient.dart';
import 'package:social_media_app/data/model/todo_model/todo_model.dart';
import '../../domain/repository/repository.dart';

import '../model/CommentModel/CommentModel.dart';
import '../model/user_model/user_model.dart';

class RepositoryImpl implements Repository {
  final ApiClient _apiClient;
  RepositoryImpl(this._apiClient);

  @override
  Future<List<TodoModel>> getAllTodos() async {
    final response = await _apiClient.get("todos");
    if (response!.statusCode == 200) {
      List jsonData = json.decode(response.body);
      //Logger().i(jsonData);
      return jsonData.map((todo) => TodoModel.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<List<CommentModel>> getAllComments() async{
    final response = await _apiClient.get(Uri.parse('https://jsonplaceholder.typicode.com/comments') as String);
    if(response!.statusCode == 200){
      List <dynamic> jsonData = json.decode(response.body);
      return jsonData.map((comment) => CommentModel.fromJson(comment)).toList();
    }else{
      throw Exception('Failed request with status : ${response.statusCode}.');
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() {
    return _apiClient.getUsersFromApi();
  }
}
