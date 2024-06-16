import 'package:flutter/material.dart';
import 'package:wallpaper_app_2/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(category.name),
          // Mostrar algunas imágenes de la categoría
        ],
      ),
    );
  }
}
