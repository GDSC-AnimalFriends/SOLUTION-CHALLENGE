import 'package:flutter/material.dart';

class RegisterBaseWidget extends StatelessWidget {
  final List<Widget> widgetList;
  const RegisterBaseWidget({
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
