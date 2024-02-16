import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final Image icon;
  final GestureTapCallback onPressed;
  IconButtonCustom({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 91, 91, 91),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: icon),
    );
  }
}
