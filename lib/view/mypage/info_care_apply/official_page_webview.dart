import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/apply_care_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';

class OfficialPageWebview extends GetView<ApplyCareController> {
  const OfficialPageWebview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOnlyBack(
        appBarTitle: ' ',
      ),
      body: WebViewWidget(controller: controller.getController()),
    );
  }
}
