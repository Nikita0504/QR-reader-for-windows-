import 'package:coffee_goose/view/screens/mainScreen.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/mainScreen',
      page: () => MainScreen(),
    ),
  ];
}
