import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

import '../models/meal.dart';

class TabsBottomScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsBottomScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsBottomScreen> createState() => _TabsBottomScreenState();
}

class _TabsBottomScreenState extends State<TabsBottomScreen> {
  List<Map<String, dynamic>>? _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals ${_pages![_selectedPageIndex]['title']}'),
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              label: 'Favorites')
        ],
      ),
    );
  }
}
