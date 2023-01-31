// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';
import 'package:integration_flutter_app/design/widgets/dashboard_item.dart';

class IntegrationDashboard extends StatelessWidget {
  IntegrationDashboard({
    super.key,
    required this.title,
  });
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(

            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => Divider(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return DashboardItem(
                      name: "Test",
                      serialNumber: 123123,
                      currentProblems: "No Problems",
                      type: 1);
                }),
                itemCount: 2,
              ),
            ]),
      ),
    );
  }
}
