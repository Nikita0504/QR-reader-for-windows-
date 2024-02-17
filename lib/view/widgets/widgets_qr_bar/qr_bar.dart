import 'package:coffee_goose/view/widgets/widgets_qr_bar/image_widget.dart';
import 'package:coffee_goose/view/widgets/widgets_qr_bar/pick_color.dart';
import 'package:coffee_goose/view/widgets/widgets_qr_bar/sliders.dart';
import 'package:flutter/material.dart';

class qrBar extends StatelessWidget {
  const qrBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      height: size.height * 0.16,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 63, 63, 63),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          const ImageWidget(),
          SizedBox(width: size.width * 0.01),
          const PickColor(
            text: 'QR code color',
            index: 0,
          ),
          SizedBox(width: size.width * 0.01),
          const PickColor(
            text: 'Data color',
            index: 1,
          ),
          SizedBox(width: size.width * 0.01),
          const PickColor(
            text: 'Border color',
            index: 2,
          ),
          const SliderWidget()
        ],
      ),
    );
  }
}
