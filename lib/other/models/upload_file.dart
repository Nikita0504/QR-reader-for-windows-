import 'dart:io';
import 'package:coffee_goose/other/controllers/receiving_or_sending_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

Future uploadFile(File imageFile, var path) async {
  final ReceivingOrSendingData api = Get.put(ReceivingOrSendingData());
  final ref = FirebaseStorage.instance.ref().child('file/${path.name}');
  final snapshot = await ref.putFile(imageFile).whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();
  print('URL ${urlDownload}');
  api.link.value = urlDownload.toString();
}
