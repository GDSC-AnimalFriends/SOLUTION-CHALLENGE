import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:solution_challenge/data/model/user_model.dart';
import 'package:solution_challenge/util/storage_key.dart';
import 'package:solution_challenge/util/storage_util.dart';

class AuthService with StorageUtil {
  //회원가입
  Future<int> register(UserModel userModel, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.email, password: password);

      final refType = userModel.type ? "old" : "young";
      final uid = credential.user!.uid;
      credential.user!.updateDisplayName(userModel.name);
      credential.user!.updatePhotoURL(
          "https://firebasestorage.googleapis.com/v0/b/gdsc-solution-challenge-183be.appspot.com/o/user-account.png?alt=media&token=e826f6ec-5147-4d68-a928-22b426a6d385"); //기본 이미지 url 들어가면 됨

      DatabaseReference ref = FirebaseDatabase.instance.ref().child(refType);
      ref.child(uid).set(userModel.toJson());

      saveString(UID_KEY, uid);
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
    return 0;
  }

  //로그인
  Future<int> login(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      saveString(UID_KEY, credential.user!.uid);
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
    return 0;
  }

  //로그아웃
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //현재 유저정보 조회 (이메일,이름,프로필url,uid)
  User? getUserInfo() {
    return FirebaseAuth.instance.currentUser;
  }
}
