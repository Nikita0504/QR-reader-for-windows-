import 'package:coffee_goose/view/screens/WelcomeScreen.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/signIn',
      page: () => SignIn(),
    )
  ];
}
