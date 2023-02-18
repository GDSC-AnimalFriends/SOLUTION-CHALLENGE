import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class RegisterBaseWidget extends StatelessWidget {
  final List<Widget> widgetList;
  final bool resizeBottom;
  final Widget bottomSheet;
  const RegisterBaseWidget({
    super.key,
    required this.widgetList,
    required this.resizeBottom,
    required this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: resizeBottom,
        appBar: const AppBarOnlyBack(
          appBarTitle: "",
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgetList,
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: bottomSheet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
