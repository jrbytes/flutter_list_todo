import 'package:flutter_list_todo/src/controllers/home_controller.dart';
import 'package:flutter_list_todo/src/models/todo_model.dart';
import 'package:flutter_list_todo/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);

  test('deve preencher variável todos', () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
