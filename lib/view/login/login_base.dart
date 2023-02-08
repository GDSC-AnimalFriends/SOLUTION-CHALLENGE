import 'package:flutter/material.dart';

class LoginBaseScreen extends StatelessWidget {
  final List<Widget> widgetList;
  const LoginBaseScreen({
    super.key,
    required this.widgetList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetList,
            ),
          ),
        ),
      ),
    );
  }
}
