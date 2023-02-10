import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarOnlyBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarOnlyBack({super.key});
  void back() {
    Get.back();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: back,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
