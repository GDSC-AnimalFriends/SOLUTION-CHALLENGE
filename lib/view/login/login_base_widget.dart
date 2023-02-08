import 'package:flutter/material.dart';

class LoginBaseWidget extends StatelessWidget {
  final List<Widget> widgetList;
  final bool resizeBottom;
  const LoginBaseWidget({
    super.key,
    required this.widgetList,
    required this.resizeBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeBottom,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgetList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
