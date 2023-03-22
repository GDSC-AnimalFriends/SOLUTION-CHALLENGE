//파이어베이스와 통신용
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class FirebaseClient with StorageUtil {
  String getImgUrl() {
    final uid = getString(UID_KEY);
    databaseRef.child('$userType/$uid').once().then((value) {
      Map<dynamic, dynamic> user = value.snapshot.value as Map;
      return user["imgUrl"];
    });
    return DEFUALT_URL;
  }
}
