import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:coffee_goose/other/models/upload_file.dart';

class ImageController extends GetxController {
  late Rx<File> imageFile = Rx<File>(File(''));
  late Rx<File> otherImageFile = Rx<File>(File(''));
  List<int>? imageBytes;
  List<int>? otherImageBytes;
  late String base64Image;
  late String otherBase64Image;
  Rx<Color> colorMode = Colors.grey.obs;
  Rx<TextEditingController> textController = TextEditingController().obs;
  var returnImage;
  Rx<bool> sliderMode = true.obs;
  Future pickImageFromGallery(
      bool saveOtherImage, String clickingButton) async {
    returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null && clickingButton == 'create') {
      imageFile.value = File(returnImage.path);
      colorMode = Colors.green.obs;
      imageBytes = imageFile.value.readAsBytesSync();
      Uint8List UintimageBytes =
          Uint8List.fromList(imageFile.value.readAsBytesSync());
      img.Image? image = img.decodeImage(UintimageBytes);
      List<int> compressedBytes = img.encodeJpg(image!, quality: 10);
      base64Image = base64Encode(compressedBytes);
      uploadFile(imageFile.value, returnImage);
      sliderMode = false.obs;
    } else if (returnImage == null) {
      colorMode = Colors.red.obs;
    }
    if (saveOtherImage != false) {
      otherImageFile.value = File(returnImage!.path);
      otherImageBytes = otherImageFile.value.readAsBytesSync();
      Uint8List UintimageBytes =
          Uint8List.fromList(otherImageFile.value.readAsBytesSync());
      img.Image? image = img.decodeImage(UintimageBytes);
      List<int> compressedBytes = img.encodeJpg(image!, quality: 10);
      otherBase64Image = base64Encode(compressedBytes);
    }

    update();
  }

  void removePickImageFromGallery() {
    final ReceivingOrSendingData api = Get.put(ReceivingOrSendingData());
    imageFile = Rx<File>(File(''));
    colorMode = Colors.grey.obs;
    api.link = ''.obs;
    sliderMode = true.obs;
    update();
  }
}
