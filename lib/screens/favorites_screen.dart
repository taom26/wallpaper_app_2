import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app_2/providers/wallpaper_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = Provider.of<WallpaperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: wallpaperProvider.favorites.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.builder(
              itemCount: wallpaperProvider.favorites.length,
              itemBuilder: (context, index) {
                final image = wallpaperProvider.favorites[index];
                return ListTile(
                  title: Text(image.url),
                  onTap: () {
                    // Implementar la vista previa de la imagen y la configuración como fondo de pantalla
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      wallpaperProvider.removeFromFavorites(image);
                    },
                  ),
                );
              },
            ),
    );
  }
}
