import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/ui/integration_dashboard.dart';
import 'package:integration_flutter_app/components/profile/ui/profile_screen.dart';
import 'package:integration_flutter_app/components/storage/ui/unit_list.dart';
import 'package:integration_flutter_app/components/tasks/tasks_screen.dart';
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
                url:
                    "https://media.licdn.com/dms/image/D4E03AQHgf5CKvuUH8w/profile-displayphoto-shrink_800_800/0/1687419413255?e=1694649600&v=beta&t=GREcvaPziLp_0RiDq3ZCteIGzO5dBqCyHJ4whJxydno"),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(),
          ListTile(
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const IntegrationDashboard()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Lager"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TileScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Aufgabenverwaltung"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CalendarScreen()));
            },
          ),
          const Divider(),
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
