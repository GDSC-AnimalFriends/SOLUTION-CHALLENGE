import 'package:get/get.dart';

class ListController extends GetxController {
  List todos = ["hello"].obs;
  List done = [].obs;

  @override
  void onInit() {
    todos.add("test");
    super.onInit();
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
