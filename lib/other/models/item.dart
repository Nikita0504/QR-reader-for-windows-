import 'dart:ui';

class Item {
  final String base64;
  final String meaning;
  final String color1;
  final String color2;
  final String color3;
  final String scale;
  final String borderSize;

  Item({
    required this.base64,
    required this.meaning,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.scale,
    required this.borderSize,
  });

  factory Item.fromJson(Map<String, dynamic> jsonData) {
    return Item(
      base64: jsonData['base64'],
      meaning: jsonData['meaning'],
      color1: jsonData['color1'],
      color2: jsonData['color2'],
      color3: jsonData['color3'],
      scale: jsonData['scale'],
      borderSize: jsonData['borderSize'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'base64': base64,
      'meaning': meaning,
      'color1': color1,
      'color2': color2,
      'color3': color3,
      'scale': scale,
      'borderSize': borderSize,
    };
  }
}
