import 'package:dio/dio.dart';
import 'package:flutter_list_todo/src/models/todo_model.dart';

class TodoRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<TodoModel> todos = [];
    for (var json in list) {
      todos.add(TodoModel.fromJson(json));
    }

    return todos;
  }
}
