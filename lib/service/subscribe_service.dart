import 'package:firebase_database/firebase_database.dart';

class SubscribeService {
  final databaseRef = FirebaseDatabase.instance.ref();

  void searchUser(String email) {
    Query query = databaseRef.orderByChild("email").equalTo(email);
    query.once().then((value) {
      print(value.snapshot.value);
    });
  }
}
