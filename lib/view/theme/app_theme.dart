import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

// 앱 내 테마 정의하는 공간. 색/폰트/텍스트 스타일은 여기 정의해주세요
final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.amber,
  highlightColor: Colors.amber,
  fontFamily: null,
  textTheme: const TextTheme(
    headline1:
        TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: black),
    headline2:
        TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: black),
    headline3:
        TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: black),
  ),
);
