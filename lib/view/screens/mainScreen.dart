import 'package:coffee_goose/other/controllers/globalController.dart';
import 'package:coffee_goose/other/controllers/showPageInBody.dart';
import 'package:coffee_goose/view/widgets/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<GlobalController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Menu(),
          GetBuilder<ShowPageInBody>(
            init: ShowPageInBody(),
            builder: (controllerPage) {
              return Center(
                child: controllerPage.bodyWidgets.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
