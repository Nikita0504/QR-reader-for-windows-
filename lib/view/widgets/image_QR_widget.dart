import 'dart:io';
import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ImageQRWidget extends StatelessWidget {
  const ImageQRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ReceivingOrSendingData>(
      init: ReceivingOrSendingData(),
      builder: (controller) {
        return Obx(() => Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 63, 63),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: controller.imageAPI?.value != null
                  ? Container(
                      width: size.width * 0.3,
                      height: size.height * 0.6,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 63, 63, 63),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: controller.imageAPI!.value,
                    )
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
                    ),
            ));
      },
    );
  }
}
