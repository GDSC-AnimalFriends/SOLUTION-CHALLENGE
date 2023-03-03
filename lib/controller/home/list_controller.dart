import 'package:get/get.dart';

class ListController extends GetxController {
  List todos = ["hello"].obs;
  List done = [].obs;

  @override
  void onInit() {
    todos.add("test");
    super.onInit();
  }

  void newonInit(String todo) {
    // Todo 추가 페이지에서 사용하려고 지수가 새로 만들었어요.
    todos.add(todo);
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
