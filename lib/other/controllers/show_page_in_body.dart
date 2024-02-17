import 'package:coffee_goose/view/widgets/body_widgets/create_qr-code.dart';
import 'package:coffee_goose/view/widgets/body_widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPageInBody extends GetxController {
  Rx<Widget> bodyWidgets =
      const Center(key: ValueKey<int>(3), child: CircularProgressIndicator())
          .obs;

  bool showWelcomeScreen = true;

  void changePages(var page) {
    bodyWidgets = page;
    update();
  }

  @override
  void onInit() {
    if (showWelcomeScreen == true) {
      bodyWidgets = WelcomeScreen(
        onPressed: () {
          changePages(CreateQR().obs);
        },
      ).obs;
    } else {
      bodyWidgets = CreateQR().obs;
    }
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
