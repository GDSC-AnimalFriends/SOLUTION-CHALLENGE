//파이어베이스와 통신용
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class FirebaseClient with StorageUtil {
  //내 이미지 가져오기
  String getImgUrl() {
    final uid = getString(UID_KEY);
    databaseRef.child('$userType/$uid').once().then((value) {
      Map<dynamic, dynamic> user = value.snapshot.value as Map;
      print(user["imageUrl"]);
      return user["imageUrl"];
    });
    return DEFUALT_URL;
  }

  //유저 검색 (구독자 찾기)
  Future<UserModel?> searchUser(String email) async {
    if (email == firebaseAuth.currentUser?.email) {
      Get.snackbar("검색오류", "본인 아이디는 추가할 수 없습니다");
      return null;
    }
    final oppositeType = isOldUser ? TYPE_YOUNG : TYPE_OLD;
    late UserModel result;
    Query query =
        databaseRef.child(oppositeType).orderByChild("email").equalTo(email);
    await query.once().then((value) {
      final snapshotValue = value.snapshot.value;
      if (snapshotValue == null) return null;
      Map<dynamic, dynamic> user = value.snapshot.value as Map;
      final uid = user.keys.first;
      print(uid);
      result = UserModel(
        id: uid,
        name: user[uid]['name'],
        phone: user[uid]['phone'],
        email: user[uid]['email'],
        imageUrl: user[uid]['imageUrl'],
      );
    });
    return result;
  }
}
