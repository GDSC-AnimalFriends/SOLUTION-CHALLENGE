import 'package:get/get.dart';
import '../controller/home/todo_list_controller.dart';

class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoListController>(
      () => TodoListController(),
    );
  }
}
