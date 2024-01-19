import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedSceenIndex = 0;

  final List<Map<String, Object>> _screens = const [
    {
      'title': 'Lista de Categorias',
      'screen': CategoryScreen(),
    },
    {
      'title': 'Lista de Favoritos',
      'screen': FavoriteScreen(),
    },
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedSceenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedSceenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedSceenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedSceenIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectScreen,
        backgroundColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
