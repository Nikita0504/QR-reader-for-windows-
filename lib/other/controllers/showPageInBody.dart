import 'package:coffee_goose/view/widgets/bodyWidgets/createQR-code.dart';
import 'package:coffee_goose/view/widgets/bodyWidgets/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ShowPageInBody extends GetxController {
  Rx<Widget> bodyWidgets =
      const Center(key: ValueKey<int>(3), child: CircularProgressIndicator())
          .obs;

  bool showWelcomeScreen = false;

  void changePages(var page) {
    bodyWidgets = page;
    update();
  }

  @override
  void onInit() {
    if (showWelcomeScreen == true) {
      bodyWidgets = WelcomeScreen(
        onPressed: () {
          changePages(CreateQR(
            onPressed: () {},
          ).obs);
        },
      ).obs;
    } else {
      bodyWidgets = CreateQR(
        onPressed: () {},
      ).obs;
    }
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
