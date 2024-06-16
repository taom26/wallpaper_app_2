import 'package:wallpaper_app_2/models/image.dart';

class Category {
  final int id;
  final String name;
  final List<ImageModel> images;

  Category({
    required this.id,
    required this.name,
    required this.images,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0, // Proporcionar un valor predeterminado si es nulo
      name:
          json['name'] ?? '', // Proporcionar un valor predeterminado si es nulo
      images: (json['images'] as List<dynamic>? ?? [])
          .map((imageJson) => ImageModel.fromJson(imageJson))
          .toList(),
    );
  }
}
