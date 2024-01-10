import 'package:coffee_goose/view/widgets/menu/iconButtons/iconButton.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width * 0.15,
      color: const Color.fromARGB(255, 63, 63, 63),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButtonCustom(
            icon: const Icon(
              Icons.pending,
              size: 50,
            ),
            onPressed: () {}),
        IconButtonCustom(
            icon: const Icon(
              Icons.pending,
              size: 50,
            ),
            onPressed: () {}),
        IconButtonCustom(
            icon: const Icon(
              Icons.pending,
              size: 50,
            ),
            onPressed: () {}),
      ]),
    );
  }
}
