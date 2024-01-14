import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageController extends GetxController {
  late Rx<File> imageFile = Rx<File>(File(''));
  List<int>? imageBytes;
  late String base64Image;
  Future pickImageFromGallery() async {
    var returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      imageFile.value = File(returnImage.path);
      imageBytes = imageFile.value.readAsBytesSync();
      Uint8List UintimageBytes =
          Uint8List.fromList(imageFile.value.readAsBytesSync());
      img.Image? image = img.decodeImage(UintimageBytes);
      List<int> compressedBytes = img.encodeJpg(image!, quality: 10);
      base64Image = base64Encode(compressedBytes);
      print(base64Image);
      print('/////////////');
      print(imageBytes!.length);
      print(compressedBytes.length);
    }
  }
}
