import 'dart:convert';

import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/other/models/item.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalController globalController = Get.put(GlobalController());
Future saveHistory(String base64, String meaning, String color1, String color2,
    String color3) async {
  globalController.items.add(Item(
      base64: base64,
      meaning: meaning,
      color1: color1,
      color2: color2,
      color3: color3));

  List<Map<String, dynamic>> itemListJson =
      globalController.items.map((item) => item.toJson()).toList();
  final String encodedData = json.encode(itemListJson);

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print(globalController.items);
  prefs.setString('items', encodedData);
}

Future getHistory() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? itemsString = prefs.getString('items');
    if (itemsString != null) {
      return prefs.getString('items');
    } else {
      print("No items found in SharedPreferences");
      return null;
    }
  } catch (e) {
    print("Error reading items from SharedPreferences: $e");
    return null;
  }
}

Future saveStatus(bool status) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('status', status);
}

Future getStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('status') ?? false;
}

Future initItems() async {
  //final SharedPreferences prefs = await SharedPreferences.getInstance();
  //await prefs.clear();
  if (await getHistory() != null) {
    List<dynamic>? itemsJson = jsonDecode(await getHistory());
    globalController.items =
        itemsJson!.map((itemJson) => Item.fromJson(itemJson)).toList();
  } else {
    globalController.items = [];
  }
  bool? status = await getStatus();
  globalController.showPageInBody.showWelcomeScreen = status ?? true;
}
