part of './app_pages.dart';

//앱 내 라우트를 정의하는 공간. "/ + 이름"으로 작명해주세요
abstract class Routes {
  static const LOGIN = '/login';
  static const REGISTER_TYPE = '/register_type';
  static const REGISTER_NAME = '/register_name';
  static const REGISTER_NUMBER = '/register_number';
  static const REGISTER_COMPLETE = '/register_complete';
  static const HOME = '/home';
  static const MYPAGE = '/my_page';
  static const TODO = '/todo';
}
