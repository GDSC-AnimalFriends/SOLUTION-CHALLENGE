import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

class VisibleControlText extends StatelessWidget {
  final bool visible;
  final String text;

  const VisibleControlText({
    super.key,
    required this.visible,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Opacity(
          opacity: visible ? 1.0 : 0.0,
          child: Text(
            text,
            style: errorText,
          ),
        ),
      ],
    );
  }
}
