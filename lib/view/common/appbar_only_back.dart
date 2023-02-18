import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarOnlyBack extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const AppBarOnlyBack({
    super.key,
    required this.appBarTitle,
  });
  void back() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: Theme.of(context).textTheme.headline3,
      ),
      leading: IconButton(
        onPressed: back,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
