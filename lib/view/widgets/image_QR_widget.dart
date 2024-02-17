import 'dart:io';
import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ImageQRWidget extends StatelessWidget {
  const ImageQRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ImageController>(
      init: ImageController(),
      builder: (controller) {
        return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 63, 63, 63),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: controller.otherImageFile.value.path.isNotEmpty
                ? Container(
                    width: size.width * 0.3,
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 63, 63, 63),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child:
                        Image.file(File(controller.otherImageFile.value.path)))
                : Container(
                    width: size.width * 0.3,
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 63, 63, 63),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(
                      'select QR',
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                  ));
      },
    );
  }
}
