import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app_2/models/category.dart';
import 'package:wallpaper_app_2/models/image.dart';

class WallpaperProvider with ChangeNotifier {
  final List<Category> _categories = [];
  final List<ImageModel> _favorites = [];
  bool _isDarkMode = false;

  List<Category> get categories => _categories;
  List<ImageModel> get favorites => _favorites;
  bool get isDarkMode => _isDarkMode;

  WallpaperProvider() {
    _loadTheme();
    fetchCategories();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isDarkMode', _isDarkMode);
    });
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:9191/api/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print('Fetched Categories: $data'); // Print fetched data
      _categories.clear();
      _categories.addAll(
          data.map((categoryJson) => Category.fromJson(categoryJson)).toList());
      notifyListeners();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void addToFavorites(ImageModel image) {
    _favorites.add(image);
    notifyListeners();
  }

  void removeFromFavorites(ImageModel image) {
    _favorites.remove(image);
    notifyListeners();
  }
}
