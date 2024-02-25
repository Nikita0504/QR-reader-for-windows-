import 'dart:io';
import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:coffee_goose/view/widgets/widgets_qr_bar/pick_image_button.dart';
import 'package:coffee_goose/view/widgets/widgets_qr_bar/remove_image_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ImageController>(
      init: ImageController(),
      builder: (controllerImage) {
        return Obx(() => Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: size.width * 0.055,
                  height: size.height * 0.125,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 63, 63, 63),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: controllerImage.imageFile.value.path.isNotEmpty
                      ? GetBuilder<GlobalController>(
                          init: GlobalController(),
                          builder: (controller) => Obx(() =>
                              controller.api.link.value != ''
                                  ? Image.network(controller.api.link.value)
                                  : CircularProgressIndicator()))
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
                    top: size.height * 0.0125,
                    right: size.width * 0.005,
                    child: InkWell(
                        onTap: () {
                          controllerImage.pickImageFromGallery(false, 'create');
                        },
                        child: const PickImageButton())),
                Positioned(
                    top: size.height * 0.12,
                    right: size.width * 0.005,
                    child: InkWell(
                        onTap: () {
                          controllerImage.removePickImageFromGallery();
                        },
                        child: const RemovePickImageButton()))
              ],
            ));
      },
    );
  }
}
