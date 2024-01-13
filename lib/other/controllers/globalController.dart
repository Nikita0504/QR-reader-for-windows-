import 'package:coffee_goose/other/controllers/showPageInBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final ShowPageInBody showPageInBody = Get.put(ShowPageInBody());
  Rx<Color> colorMode = Colors.grey.obs;
  bool? colorSelection;
  void ColorMode() {
    if (colorSelection == true) {
      colorMode = Colors.green.obs;
    } else {
      colorMode = Colors.red.obs;
    }
    update();
  }
}