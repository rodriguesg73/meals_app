import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  Widget _createItem(
      IconData iconData, String label, Function() onTapFunction) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).hintColor,
          alignment: Alignment.bottomRight,
          child: Text(
            'Vamos Cozinhar?',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _createItem(Icons.restaurant, 'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
        _createItem(
          Icons.settings,
          'Configurações',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
        )
      ]),
    );
  }
}
