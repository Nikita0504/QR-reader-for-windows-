import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final GestureTapCallback onPressed;
  const WelcomeScreen({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Welcome, Dear User',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 91, 91)),
            onPressed: onPressed,
            child: Center(
              child: Text(
                'Let’s Go',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ))
      ],
    );
  }
}
