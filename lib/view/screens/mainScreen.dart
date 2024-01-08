import 'package:coffee_goose/view/widgets/bodyWidgets/welcomeScreen.dart';
import 'package:coffee_goose/view/widgets/menu/menu.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Row(
        children: [
          Menu(),
          Padding(
            padding: EdgeInsets.fromLTRB(size.width * 0.25, 0, 0, 0),
            child: WelcomeScreen(
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
