import 'dart:convert';
import 'package:coffee_goose/other/models/qr_generate_animated.dart';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceivedQR extends GetView<ReceivingOrSendingData> {
  const ReceivedQR({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    QR_Animated qrModel = QR_Animated.fromJson(controller.jsonList);
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.1,
      child: qrModel.base64Image != null
          ? Image.memory(base64Decode(qrModel.base64Image.toString()))
          : Center(child: CircularProgressIndicator()),
    );
  }
}
