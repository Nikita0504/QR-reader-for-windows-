import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceivingOrSendingData extends GetxController {
  var jsonList;
  Rx<Image>? imageAPI;

  void getData() async {
    try {
      var response = await Dio().post(
          'https://skyprayer-animated-qr-maker.hf.space/qr_generate/static');
      if (response.statusCode == 200) {
        jsonList = response.data['data'];
        imageAPI?.value = Image.memory(base64Decode(jsonList['image_bytes']));
        print(jsonList['image_bytes'].toString());
        update();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
