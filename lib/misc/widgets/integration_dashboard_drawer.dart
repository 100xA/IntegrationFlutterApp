import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/profile/bloc/profile_cubit.dart';
import 'package:integration_flutter_app/components/profile/ui/profile_screen.dart';

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
            title: const Text("Aufgabenverwaltung"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Profil"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}
