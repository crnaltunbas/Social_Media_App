import 'package:json_annotation/json_annotation.dart';
part 'todo_model.g.dart';
/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false
@JsonSerializable()
class TodoModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  TodoModel({
      this.userId, 
      this.id, 
      this.title, 
      this.completed,});

 factory TodoModel.fromJson(dynamic json) => _$TodoModelFromJson(json);


  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

}