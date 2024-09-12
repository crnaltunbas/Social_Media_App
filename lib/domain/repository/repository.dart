
import '../../data/model/todo_model/todo_model.dart';

abstract class Repository {
  Future<List<TodoModel>> getAllTodos();
}