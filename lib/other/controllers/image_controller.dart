import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageController extends GetxController {
  late Rx<File> imageFile = Rx<File>(File(''));
  late Rx<File> otherImageFile = Rx<File>(File(''));
  List<int>? imageBytes;
  List<int>? otherImageBytes;
  late String base64Image;
  late String otherBase64Image;
  Rx<Color> colorMode = Colors.grey.obs;
  Rx<TextEditingController> textController = TextEditingController().obs;
  Future pickImageFromGallery(
      bool saveOtherImage, String clickingButton) async {
    var returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null && clickingButton == 'create') {
      imageFile.value = File(returnImage.path);
      colorMode = Colors.green.obs;
      imageBytes = imageFile.value.readAsBytesSync();
      Uint8List UintimageBytes =
          Uint8List.fromList(imageFile.value.readAsBytesSync());
      img.Image? image = img.decodeImage(UintimageBytes);
      List<int> compressedBytes = img.encodeJpg(image!, quality: 10);
      base64Image = base64Encode(compressedBytes);
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
}
