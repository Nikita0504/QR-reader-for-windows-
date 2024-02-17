import 'package:coffee_goose/other/controllers/image_controller.dart';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:coffee_goose/other/controllers/show_page_in_body.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final ShowPageInBody showPageInBody = Get.put(ShowPageInBody());
  final ImageController getImage = Get.put(ImageController());
  final ReceivingOrSendingData api = Get.put(ReceivingOrSendingData());
  @override
  void onInit() {
    // api.getData();
    // TODO: implement onInit
    super.onInit();
  }
}
