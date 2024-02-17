import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/view/widgets/widgets_qr_bar/image_qr_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecryptQR extends GetView<GlobalController> {
  const DecryptQR({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                const ImageQRWidget(),
              ],
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.getImage.pickImageFromGallery(true, '');
                  },
                  child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.1,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 63, 63, 63),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Decrypt QR ',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Icon(Icons.qr_code),
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  width: size.width * 0.3,
                  height: size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 63, 63, 63),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
