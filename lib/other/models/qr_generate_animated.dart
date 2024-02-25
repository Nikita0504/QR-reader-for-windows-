class QR_Animated {
  final String base64Image;

  QR_Animated({
    required this.base64Image,
  });
  factory QR_Animated.fromJson(dynamic json) {
    return QR_Animated(base64Image: json['image_base64']);
  }

  Map<String, dynamic> toJson() => {
        'image_base64': base64Image,
      };
}
