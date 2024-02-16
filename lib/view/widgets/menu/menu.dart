import 'package:coffee_goose/other/controllers/show_page_in_body.dart';
import 'package:coffee_goose/view/widgets/body_widgets/create_QR-code.dart';
import 'package:coffee_goose/view/widgets/body_widgets/decrypt_QR.dart';
import 'package:coffee_goose/view/widgets/menu/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    final ShowPageInBody showPageInBody = Get.put(ShowPageInBody());
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width * 0.15,
      color: const Color.fromARGB(255, 63, 63, 63),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButtonCustom(
            icon: Image.asset('assets/images/icons/image 1.png'),
            onPressed: () {
              showPageInBody.changePages(CreateQR().obs);
            }),
        IconButtonCustom(
            icon: Image.asset('assets/images/icons/image 2.png'),
            onPressed: () {
              showPageInBody.changePages(const DecryptQR().obs);
            }),
        IconButtonCustom(
            icon: Image.asset('assets/images/icons/image 3.png'),
            onPressed: () {}),
      ]),
    );
  }
}
