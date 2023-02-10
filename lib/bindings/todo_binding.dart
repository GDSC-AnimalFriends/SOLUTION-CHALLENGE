import 'package:get/get.dart';
import 'package:solution_challenge/controller/todo/todo_controller.dart';

class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() {
      return TodoController();
    });
  }
}
