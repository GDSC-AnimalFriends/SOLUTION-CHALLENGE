import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '설정',
        )
      ),
    );
  }
}
