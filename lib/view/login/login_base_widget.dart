import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class LoginBaseWidget extends StatelessWidget {
  final List<Widget> widgetList;
  const LoginBaseWidget({
    super.key,
    required this.widgetList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgetList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
