import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app_2/providers/wallpaper_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = Provider.of<WallpaperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: wallpaperProvider.isDarkMode,
            onChanged: (bool value) {
              wallpaperProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
