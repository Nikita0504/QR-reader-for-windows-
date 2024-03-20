import 'package:coffee_goose/other/controllers/global_controller.dart';
import 'package:coffee_goose/view/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends GetView<GlobalController> {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: Column(
            children: List.generate(
                controller.items.length, (index) => ItemWidget(index: index)),
          ),
        ),
      ],
    );
  }
}
