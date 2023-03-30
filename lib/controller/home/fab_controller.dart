import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FABController extends GetxController {
  bool overlayed = false;
  OverlayEntry overlay;

  FABController({
    required this.overlay,
  });

  void insertOverlay(context) {
    Navigator.of(context).overlay!.insert(overlay);
    checkOverlayed();
  }

  void disposeOverlay(context) {
    overlay.remove();
    checkOverlayed();
  }

  void checkOverlayed() {
    overlayed = !overlayed;
  }
}
