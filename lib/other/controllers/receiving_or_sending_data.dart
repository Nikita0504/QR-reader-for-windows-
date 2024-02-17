import 'package:coffee_goose/models/qr_generate_static.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ReceivingOrSendingData extends GetxController {
  var jsonList;
  Future<void> getData(
    String content,
  ) async {
    try {
      var response = await Dio().post(
          'https://skyprayer-animated-qr-maker.hf.space/qr_generate/static',
          data: {
            "content": content,
            "border_size": 1,
            "scale": 15,
            "qr_code_color": {"red": 194, "green": 37, "blue": 37},
            "data_color": {"red": 250, "green": 37, "blue": 37},
            "border_color": {"red": 255, "green": 255, "blue": 255}
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
