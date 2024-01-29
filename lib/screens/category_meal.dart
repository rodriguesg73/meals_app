// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoryMealScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          }),
    );
  }
}
