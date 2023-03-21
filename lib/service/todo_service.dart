import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/model/todo_model.dart';

class TodoService {
  void addTodo({required TodoModel todo, required String username}) {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("users/$username/${todo.todoid.toString().replaceAll('.', '_')}");
    print(todo.toJson());
    ref.set(todo.toJson());
  }

  void deleteTodo({required String todoid, required String username}) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/$username/$todoid");
    ref.remove();
  }

  void updateTodo({required String todouid, required TodoModel todo}) {
    //등록한 todo uid를 수정함.
  }
}
