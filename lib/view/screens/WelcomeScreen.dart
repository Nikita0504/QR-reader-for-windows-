import 'package:coffee_goose/view/widgets/menu/menu.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Menu()],
      ),
    );
  }
}
