import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app_2/providers/wallpaper_provider.dart';
import 'package:wallpaper_app_2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WallpaperProvider(),
      child: Consumer<WallpaperProvider>(
        builder: (context, wallpaperProvider, child) {
          return MaterialApp(
            title: 'Wallpaper App',
            theme: wallpaperProvider.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
