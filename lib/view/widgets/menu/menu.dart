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
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButtonCustom(
            icon: Image.asset('assets/images/icons/image 1.png'),
            onPressed: () {}),
        IconButtonCustom(
            icon: Image.asset('assets/images/icons/image 2.png'),
            onPressed: () {}),
        IconButtonCustom(
            icon: Image.asset('assets/images/icons/image 3.png'),
            onPressed: () {}),
      ]),
    );
  }
}
