import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWithBottomLine extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;
  const AppBarWithBottomLine({
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
        centerTitle: true,
        leading: IconButton(
          onPressed: back,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 1.0,
        elevation: 0.0,
        bottom: PreferredSize(
            child: Container(
              color: Color(0xffE5E5E5),
              height: 1,
            ),
            preferredSize: const Size.fromHeight(1)));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
