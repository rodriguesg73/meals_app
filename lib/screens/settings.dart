import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';

import '../components/drawer_item.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;

  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    Color color,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      activeColor: color,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      drawer: const DrawerItem(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _createSwitch(
                'Sem Glúten',
                'Somente exibi refeições sem glúten',
                Theme.of(context).primaryColor,
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Somente exibi refeições sem lactose',
                Theme.of(context).primaryColor,
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'Somente exibi refeições veganas',
                Theme.of(context).primaryColor,
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                'Vegetariana',
                'Somente exibi refeições Vegetariana',
                Theme.of(context).primaryColor,
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
