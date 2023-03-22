import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';

class SubscribeService {
  void searchUser(String email) {
    Query query = databaseRef.orderByChild("email").equalTo(email);
    query.once().then((value) {
      print(value.snapshot.value);
    });
  }
}
