import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _createItem(IconData icon, String label, Function() click) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: click,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.amber,
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
