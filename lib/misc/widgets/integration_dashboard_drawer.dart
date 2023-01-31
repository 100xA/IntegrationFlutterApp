import 'package:flutter/material.dart';

class IntegrationDashboardDrawer extends StatelessWidget {
  const IntegrationDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 100,
          ),
          ListTile(
            title: const Text("Maschinen"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Instandhaltung"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Personalisierung"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Aufgabenverwaltung"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Übersicht Lager"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
