import 'package:dio/dio.dart';
import 'package:flutter_list_todo/src/models/todo_model.dart';

class TodoRepository {
  late Dio dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) {
    if (client == null) {
      dio = Dio();
    } else {
      dio = client;
    }
  }

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
