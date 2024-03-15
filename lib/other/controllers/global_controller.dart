import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:coffee_goose/other/controllers/show_page_in_body.dart';
import 'package:coffee_goose/other/models/history.dart';
import 'package:coffee_goose/other/models/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final ShowPageInBody showPageInBody = Get.put(ShowPageInBody());
  final ImageController getImage = Get.put(ImageController());
  final ReceivingOrSendingData api = Get.put(ReceivingOrSendingData());
  Rx<Color> pickerColor = Colors.white.obs;
  List<Item> items = [];

  List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
  ].obs;
  void changeColor(Color color) {
    pickerColor.value = color;
    update();
  }

  void updateColor(var index) {
    api.colors[index] = pickerColor.value;
    update();
  }

  @override
  void onInit() {
    initItems();
    super.onInit();
  }
}
