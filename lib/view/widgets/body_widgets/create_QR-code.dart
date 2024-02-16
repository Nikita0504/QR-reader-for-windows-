import 'dart:io';

import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:coffee_goose/view/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQR extends GetView<GlobalController> {
  const CreateQR({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.fromLTRB(size.width * 0.045, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create QR Code',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 50),
            ),
            Row(
              children: [
                ImageWidget(),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Container(
                  width: size.width * 0.6,
                  height: size.height * 0.125,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 63, 63, 63),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: TextField(
                      controller: controller.getImage.textController.value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Container(
                  width: size.width * 0.07,
                  height: size.height * 0.125,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 63, 63, 63),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: GetBuilder<ImageController>(
                    init: ImageController(),
                    builder: (controllerPage) {
                      return IconButton(
                          onPressed: () {
                            controller.getImage
                                .pickImageFromGallery(false, 'create');
                          },
                          icon: Icon(
                            Icons.image,
                            color: controllerPage.colorMode.value,
                          ));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 91, 91, 91)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            content: Container(
                              width: size.width * 0.05,
                              height: size.height * 0.375,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 63, 63, 63),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: GetBuilder<ImageController>(
                                init: ImageController(),
                                builder: (imageController) {
                                  return Obx(() => Container(
                                      width: size.width * 0.2,
                                      height: size.height * 0.1,
                                      child: imageController
                                              .imageFile.value.path.isNotEmpty
                                          ? QrImageView(
                                              data: controller.getImage
                                                  .textController.value.text,
                                              version: QrVersions.auto,
                                              size: 320,
                                              gapless: false,
                                              embeddedImageStyle:
                                                  const QrEmbeddedImageStyle(
                                                size: Size(50, 50),
                                              ),
                                              embeddedImage: Image.file(
                                                File(imageController
                                                    .imageFile.value.path),
                                              ).image,
                                            )
                                          : QrImageView(
                                              data: controller.getImage
                                                  .textController.value.text,
                                              version: QrVersions.auto,
                                              size: 320,
                                              gapless: false,
                                            )));
                                },
                              ),
                            ),
                          ));
                },
                child: Center(
                  child: Text(
                    'Let’s Go',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 30),
                  ),
                ))
          ],
        ));
  }
}
