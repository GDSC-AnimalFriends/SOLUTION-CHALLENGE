import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class RegisterBaseWidget extends StatelessWidget {
  final List<Widget> widgetList;
  final bool resizeBottom;
  const RegisterBaseWidget({
    super.key,
    required this.widgetList,
    required this.resizeBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: resizeBottom,
      appBar: const AppBarOnlyBack(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
