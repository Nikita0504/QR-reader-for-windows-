import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

Future uploadFile(File imageFile, var path) async {
  final ReceivingOrSendingData api = Get.put(ReceivingOrSendingData());
  final ref = FirebaseStorage.instance.ref().child('file/image/${path.name}');
  final snapshot = await ref.putFile(imageFile).whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();
  api.link.value = urlDownload.toString();
}

Future uploadQRFile(var base64) async {
  final ReceivingOrSendingData api = Get.put(ReceivingOrSendingData());
  String imagePath = await saveBase64ImageToFile(base64);
  File tempFile = File(imagePath);
  String path = 'file/QR/${tempFile.path.split('/').last}';
  final ref = FirebaseStorage.instance.ref().child(path);
  UploadTask uploadTask = ref.putFile(tempFile);
  TaskSnapshot storageTaskSnapshot = await uploadTask;
  String urlDownload = await storageTaskSnapshot.ref.getDownloadURL();
  api.qrLink.value = urlDownload.toString();
  print('URLQR: $urlDownload');
}

Future<String> saveBase64ImageToFile(String base64String) async {
  Uint8List bytes = base64Decode(base64String);
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  String imagePath = '$tempPath/Gif.gif';
  final File file = File(imagePath);
  await file.writeAsBytes(bytes, flush: true);
  return imagePath;
}
