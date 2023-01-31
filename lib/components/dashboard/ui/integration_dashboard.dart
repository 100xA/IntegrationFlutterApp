// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:integration_flutter_app/misc/widgets/dashboard_item.dart';
import 'package:integration_flutter_app/misc/widgets/integration_dashboard_drawer.dart';

class IntegrationDashboard extends StatelessWidget {
  const IntegrationDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const IntegrationDashboardDrawer(),
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (_, __) => const Divider(height: 0),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return const DashboardItem(
                    name: "Sortiermaschine Peter",
                    serialNumber: 123123,
                    currentProblems: "Keine Betriebsstoffe",
                    type: 1);
              }),
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
