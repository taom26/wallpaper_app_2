class ImageModel {
  final int id;
  final String url;
  final List<String> tags;

  ImageModel({
    required this.id,
    required this.url,
    required this.tags,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? 0, // Proporcionar un valor predeterminado si es nulo
      url: json['url'] ?? '', // Proporcionar un valor predeterminado si es nulo
      tags: List<String>.from(json['tags'] ??
          []), // Proporcionar un valor predeterminado si es nulo
    );
  }
}
