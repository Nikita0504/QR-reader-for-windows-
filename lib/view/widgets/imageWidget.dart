import 'dart:io';
import 'package:coffee_goose/other/controllers/imageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ImageController>(
      init: ImageController(),
      builder: (controller) {
        return Obx(() => Container(
              width: size.width * 0.065,
              height: size.height * 0.125,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 63, 63),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: controller.imageFile.value.path.isNotEmpty
                  ? Image.memory(controller.UintimageBytes!)
                  : Container(
                      width: size.width * 0.05,
                      height: size.height * 0.1,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 54, 54, 54),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
            ));
      },
    );
  }
}
