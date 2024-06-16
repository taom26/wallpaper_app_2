import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app_2/providers/wallpaper_provider.dart';
import 'package:wallpaper_app_2/screens/category_screen.dart';
import 'package:wallpaper_app_2/screens/favorites_screen.dart';
import 'package:wallpaper_app_2/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = Provider.of<WallpaperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Wallpaper'),
        actions: [
          IconButton(
            icon: Icon(
              wallpaperProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              wallpaperProvider.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: wallpaperProvider.categories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: wallpaperProvider.categories.length,
              itemBuilder: (context, index) {
                final category = wallpaperProvider.categories[index];
                return ListTile(
                  title: Text(category.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryScreen(category: category),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
