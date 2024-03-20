import 'dart:convert';
import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/other/models/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget extends GetView<GlobalController> {
  final int index;
  const ItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Item item = controller.items[index];

    int _getColorFromHex(String hexColor) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      return int.parse(hexColor, radix: 16);
    }

    return Container(
        margin: const EdgeInsets.all(5),
        width: size.width * 0.84,
        height: size.height * 0.2,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 63, 63, 63),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            Container(
              width: size.width * 0.08,
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Image.memory(
                base64Decode(item.base64),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
              child: Column(
                children: [
                  const Text(
                    'Meaning:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.meaning,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Colors:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.04,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Color(_getColorFromHex(item.color1)),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, spreadRadius: 2),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.04,
                      height: size.height * 0.06,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(_getColorFromHex(item.color2)),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, spreadRadius: 2),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.04,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Color(_getColorFromHex(item.color3)),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, spreadRadius: 2),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
              child: Column(
                children: [
                  const Text(
                    'Scale:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.scale,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
              child: Column(
                children: [
                  const Text(
                    'Border size:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.borderSize,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
