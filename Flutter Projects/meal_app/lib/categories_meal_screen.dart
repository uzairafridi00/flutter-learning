import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoriesMealsScreen(
      {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(child: Text('The Recipes for the Category!!')),
    );
  }
}
