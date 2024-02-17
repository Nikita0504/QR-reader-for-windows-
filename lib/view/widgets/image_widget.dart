import 'dart:io';
import 'package:coffee_goose/other/controllers/image_controller.dart';
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
        return Obx(() => Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: size.width * 0.065,
                  height: size.height * 0.125,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 63, 63, 63),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: controller.imageFile.value.path.isNotEmpty
                      ? Image.file(File(controller.imageFile.value.path))
                      : Container(
                          width: size.width * 0.05,
                          height: size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 54, 54, 54),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                ),
                Positioned(
                    top: size.height * 0.11,
                    right: size.width * 0.005,
                    child: InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: Container(
                        width: size.width * 0.02,
                        height: size.height * 0.04,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 27, 133, 194),
                          borderRadius: BorderRadius.all(Radius.circular(360)),
                        ),
                      ),
                    ))
              ],
            ));
      },
    );
  }
}
