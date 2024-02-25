import 'dart:io';
import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/other/routes/routes.dart';
import 'package:coffee_goose/other/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1322, 664));
  }

  await windowManager.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD916ArElxQfJNJ_KmDd494gmyC_y0MUzo',
      appId: '1:256077994919:web:a4d9ee70fd120d2e843482',
      messagingSenderId: '256077994919',
      projectId: 'animated-qr-maker',
      authDomain: 'animated-qr-maker.firebaseapp.com',
      storageBucket: 'animated-qr-maker.appspot.com',
      measurementId: 'G-58W7Q9CJ63',
    ),
  );

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
