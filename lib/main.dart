import 'dart:io';
import 'package:coffee_goose/other/controllers/globalController.dart';
import 'package:coffee_goose/other/routes/routes.dart';
import 'package:coffee_goose/other/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1322, 664));
    WindowManager.instance.setMaximumSize(const Size(1322, 664));
  }
  await windowManager.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/mainScreen',
        getPages: Routes.routes,
        theme: CustomTheme.theme);
  }
}
