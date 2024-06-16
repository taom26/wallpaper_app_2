import 'package:flutter/material.dart';
import 'package:wallpaper_app_2/models/image.dart';

class ImageDetailScreen extends StatelessWidget {
  static const routeName = '/image-detail';

  const ImageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageModel image =
        ModalRoute.of(context)!.settings.arguments as ImageModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: Center(
        child: Image.network(image.url),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite_border),
        onPressed: () {
          // Lógica para añadir a favoritos
        },
      ),
    );
  }
}
