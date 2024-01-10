import 'package:coffee_goose/view/widgets/bodyWidgets/createQR-code.dart';
import 'package:coffee_goose/view/widgets/menu/menu.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Menu(),
          CreateQR(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
