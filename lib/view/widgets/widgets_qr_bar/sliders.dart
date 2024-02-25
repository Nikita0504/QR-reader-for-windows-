import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderWidget extends GetView<ReceivingOrSendingData> {
  const SliderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<ImageController>(
            init: ImageController(),
            builder: (imageController) => Obx(
              () => Row(
                children: [
                  Slider(
                    activeColor: imageController.sliderMode.value == true
                        ? Colors.amber[600]
                        : Colors.grey,
                    min: 1,
                    max: 10,
                    value: controller.borderSize.value,
                    onChanged: (val) => controller.borderSize.value = val,
                  ),
                  Text('Border size: ${controller.borderSize.value.ceil()}')
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              margin: EdgeInsets.fromLTRB(0, 0, 36, 0),
              child: Row(
                children: [
                  Slider(
                    activeColor: Colors.amber[600],
                    min: 1,
                    max: 10,
                    value: controller.scale.value,
                    onChanged: (val) => controller.scale.value = val,
                  ),
                  Text('Scale: ${controller.scale.value.ceil()}')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
