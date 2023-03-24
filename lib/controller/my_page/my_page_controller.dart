import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/routes/app_pages.dart';
import 'package:solution_challenge/service/auth_service.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class MyPageController extends GetxController with StorageUtil {
  User user = firebaseAuth.currentUser!;

  void logout() {
    AuthService().logout();
    Get.offAllNamed(Routes.LOGIN);
  }

  String getMyImage() {
    final imageUrl = getString(IMAGE_KEY);
    saveString(IMAGE_KEY, DEFUALT_URL);
    return imageUrl ?? DEFUALT_URL;
  }
}
