import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemovePickImageButton extends GetView<GlobalController> {
  const RemovePickImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ImageController>(
      init: ImageController(),
      builder: (controller) => Container(
        width: size.width * 0.015,
        height: size.height * 0.03,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 86, 95, 100),
          borderRadius: BorderRadius.all(Radius.circular(360)),
        ),
        child: Center(
          child: Icon(
            Icons.delete,
            size: size.width * 0.01,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
