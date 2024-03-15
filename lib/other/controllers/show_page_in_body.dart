import 'package:coffee_goose/other/models/history.dart';
import 'package:coffee_goose/view/widgets/body_widgets/create_qr-code.dart';
import 'package:coffee_goose/view/widgets/body_widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPageInBody extends GetxController {
  Rx<Widget> bodyWidgets = CreateQR().obs;

  bool showWelcomeScreen = true;

  void changePages(var page) {
    bodyWidgets = page;
    update();
  }

  void checkStatus() async {
    showWelcomeScreen = await getStatus();
    if (showWelcomeScreen == true) {
      bodyWidgets = WelcomeScreen(
        onPressed: () async {
          changePages(CreateQR().obs);
          await saveStatus(false);
        },
      ).obs;
    } else if (showWelcomeScreen == false) {
      bodyWidgets = CreateQR().obs;
    }
  }

  @override
  void onInit() {
    checkStatus();
    super.onInit();
  }
}
