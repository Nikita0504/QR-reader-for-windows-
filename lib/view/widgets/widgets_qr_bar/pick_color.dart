import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class PickColor extends GetView<GlobalController> {
  final String text;
  final int index;
  const PickColor({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: controller.pickerColor.value,
                      onColorChanged: controller.changeColor,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        controller.updateColor(index);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: GetBuilder<GlobalController>(
                init: GlobalController(),
                builder: (controller) {
                  return Container(
                    width: size.width * 0.02,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(
                      color: controller.api.colors[index],
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black, spreadRadius: 2),
                      ],
                    ),
                  );
                })),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
        )
      ],
    );
  }
}
