import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final Icon icon;
  final GestureTapCallback onPressed;
  IconButtonCustom({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: Color.fromARGB(255, 91, 91, 91),
    );
  }
}
