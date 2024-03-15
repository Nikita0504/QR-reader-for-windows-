import 'package:coffee_goose/other/models/qr_generate_animated.dart';
import 'package:coffee_goose/other/models/qr_generate_static.dart';
import 'package:coffee_goose/other/models/upload_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee_goose/other/models/history.dart';

class ReceivingOrSendingData extends GetxController {
  var jsonList;

  RxList<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.white,
  ].obs;

  Rx<double> scale = 10.0.obs;
  Rx<double> borderSize = 1.0.obs;
  RxString qrLink = ''.obs;
  RxString link = ''.obs;

  Future<void> getStaticData(
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
        String hexColor(Color color) {
          var hexCode = '#${color.value.toRadixString(16).substring(2, 8)}';
          return hexCode;
        }

        jsonList = response.data['data'];
        QR_Static qrModel = QR_Static.fromJson(jsonList);
        uploadQRFile(qrModel.base64Image);
        await saveHistory(
          qrModel.base64Image,
          content,
          hexColor(colors[0]),
          hexColor(colors[1]),
          hexColor(colors[2]),
        );
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAnimatedData(
    String content,
  ) async {
    try {
      var response = await Dio().post(
          'https://skyprayer-animated-qr-maker.hf.space/qr_generate/animated',
          data: {
            "content": content,
            "scale": scale.call(),
            "gif_link": link.value
          });
      if (response.statusCode == 200) {
        jsonList = response.data['data'];
        QR_Animated qrModel = QR_Animated.fromJson(jsonList);
        uploadQRFile(qrModel.base64Image);
        await saveHistory(
            qrModel.base64Image,
            content,
            colors[0].value.toString(),
            colors[1].value.toString(),
            colors[2].value.toString());
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
