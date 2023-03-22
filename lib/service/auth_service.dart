import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/data/provider/firebase_const.dart';
import 'package:solution_challenge/util/const_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class AuthService with StorageUtil {
  //회원가입
  Future<int> register(UserModel userModel, String password, bool type) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);

      final refType = type ? TYPE_OLD : TYPE_YOUNG;
      final uid = credential.user!.uid;
      userModel.id = uid;
      userModel.imageUrl = DEFUALT_URL;
      credential.user!.updateDisplayName(userModel.name);
      credential.user!.updatePhotoURL(refType); //URL에 가입 타입 저장

      databaseRef.child(refType).child(uid).set(userModel.toJson());

      saveString(UID_KEY, uid);
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("6자이상 비밀번호가 필요합니다");
        return 1;
      } else if (e.code == 'email-already-in-use') {
        log("가입된 이메일 입니다");
        return 2;
      }
    } catch (e) {
      log(e.toString());
      return 3;
    }
    return -1;
  }

  //로그인
  Future<int> login(String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      saveString(UID_KEY, credential.user!.uid);
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("가입된 이메일이 아닙니다");
        return 1;
      } else if (e.code == 'wrong-password') {
        log("비밀번호가 틀렸습니다");
        return 2;
      }
    } catch (e) {
      log(e.toString());
      return 3;
    }
    return -1;
  }

  //로그아웃
  void logout() async {
    await firebaseAuth.signOut();
  }
}
