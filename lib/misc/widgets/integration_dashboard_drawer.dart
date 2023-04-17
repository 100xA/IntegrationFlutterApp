import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/profile/ui/profile_screen.dart';
import 'package:integration_flutter_app/misc/widgets/integration_custom_avatar.dart';

class IntegrationDashboardDrawer extends StatelessWidget {
  const IntegrationDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Center(
            child: IntegrationCustomAvatar(
                url: "https://pbs.twimg.com/media/EhcyEQAX0AA2PwP.jpg"),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text("Lager"),
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
