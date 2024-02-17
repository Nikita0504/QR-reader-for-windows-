import 'package:coffee_goose/models/qr_generate_static.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceivingOrSendingData extends GetxController {
  var jsonList;

  RxList<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.white,
  ].obs;

  Rx<double> scale = 10.0.obs;
  Rx<double> borderSize = 1.0.obs;

  Future<void> getData(
    String content,
  ) async {
    try {
      var response = await Dio().post(
          'https://skyprayer-animated-qr-maker.hf.space/qr_generate/static',
          data: {
            "content": content,
            "border_size": borderSize.ceil(),
            "scale": scale.ceil(),
            "qr_code_color": {
              "red": colors[0].red,
              "green": colors[0].green,
              "blue": colors[0].blue
            },
            "data_color": {
              "red": colors[1].red,
              "green": colors[1].green,
              "blue": colors[1].blue
            },
            "border_color": {
              "red": colors[2].red,
              "green": colors[2].green,
              "blue": colors[2].blue
            }
          });
      if (response.statusCode == 200) {
        jsonList = response.data['data'];
        QR_Static qrModel = QR_Static.fromJson(jsonList);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
