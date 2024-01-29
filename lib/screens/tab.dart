// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meals/components/drawer_item.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category.dart';
import 'package:meals/screens/favorite_meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen(this.favoriteMeals, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedTabIndex = 0;
  late List<Map<String, Object>> _tabList;

  @override
  void initState() {
    super.initState();
    _tabList = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoryScreen(),
      },
      {
        'title': 'Lista de Favoritos',
        'screen': FavoriteMealScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(_tabList[_selectedTabIndex]['title'] as String),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: DrawerItem(),
      body: _tabList[_selectedTabIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).hintColor,
        currentIndex: _selectedTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
