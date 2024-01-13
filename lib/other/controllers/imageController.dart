import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  late Rx<File> image = Rx<File>(File(''));

  Future pickImageFromGallery() async {
    var returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      image.value = File(returnImage.path);
    }
  }
}
