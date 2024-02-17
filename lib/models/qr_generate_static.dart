class QR_Static {
  final String base64Image;

  QR_Static({
    required this.base64Image,
  });
  factory QR_Static.fromJson(dynamic json) {
    return QR_Static(base64Image: json['image_base64']);
  }

  Map<String, dynamic> toJson() => {
        'image_base64': base64Image,
      };
}
