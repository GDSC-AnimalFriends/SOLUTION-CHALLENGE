// ignore_for_file: constant_identifier_names

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
  static const MYACCOUNT_MANAGE = '/manage_my_account';
  static const SUBSCRIBER_MANAGE = '/manage_subscribe';
  static const INFO_CARE_APPLY = '/info_care_apply';
  static const SETTING = '/setting_app';
  static const ALARM = '/alarm';
  static const SUBSCRIBE_ADD = "/subscribe_add";
  static const CHECKAPPLY = "/check_how_to_apply";
  static const OFFICIAL_PAGE = "/offcial_page_webview";

}
