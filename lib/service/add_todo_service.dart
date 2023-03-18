import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/model/todo_model.dart';

class AddTodoService {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/");

  void addTodo({required TodoModel todo, required String username}) {
    //등록할 todo와 어떤 username를 매개변수로 넘겨주면 데이터베이스에 해당 todo를 넣어줌.
  }

  void deleteTodo({required String todouid, required String username}) {
    //등록한 todo uid와 어떤 username를 매개변수로 넘겨주면 데이터베이스에 해당 todo를 제거함.
  }

  void updateTodo({required String todouid, required String username}) {}
}
