import 'package:get/get.dart';
import 'package:solution_challenge/data/model/todo_model.dart';
import 'package:solution_challenge/service/todo_service.dart';

class TodoListController extends GetxController {
  List<TodoModel> todos = List<TodoModel>.empty(growable: true).obs;
  List<TodoModel> done = List<TodoModel>.empty(growable: true).obs;

  void addTodo(TodoModel todo) {
    todos.add(todo);
    TodoService().addTodo(todo: todo, username: 'noguen');
  }

  void checkToDone(int index) {
    done.add(todos.removeAt(index));
    refresh();
  }

  void checkToTodos(int index) {
    todos.add(done.removeAt(index));
    refresh();
  }
}
