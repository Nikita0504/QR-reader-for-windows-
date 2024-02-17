import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/view/widgets/widgets_qr_bar/qr_bar.dart';
import 'package:coffee_goose/view/widgets/received_qr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateQR extends GetView<GlobalController> {
  const CreateQR({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.fromLTRB(size.width * 0.1225, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create QR Code',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 50),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: size.width * 0.6,
              height: size.height * 0.125,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 63, 63),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  controller: controller.getImage.textController.value,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            qrBar(),
            SizedBox(
              height: size.height * 0.025,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 91, 91, 91)),
                onPressed: () async {
                  await controller.api
                      .getData(controller.getImage.textController.value.text);
                  // ignore: use_build_context_synchronously
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            content: Container(
                                width: size.width * 0.05,
                                height: size.height * 0.375,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 63, 63, 63),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const ReceivedQR()),
                          ));
                },
                child: Center(
                  child: Text(
                    'Let’s Go',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 30),
                  ),
                )),
          ],
        ));
  }
}
