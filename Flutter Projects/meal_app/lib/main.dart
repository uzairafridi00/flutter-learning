import 'dart:ui';
import 'package:flutter/material.dart';

import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/categories_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesScreen(),
      routes: {
        // '/category-meals': (ctx) => CategoriesMealsScreen(),
         CategoriesMealsScreen.routeName : (ctx) => CategoriesMealsScreen(),
         MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
