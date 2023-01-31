import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';

class DashboardItem extends StatelessWidget {
  final String name;
  final int serialNumber;
  final String currentProblems;
  final int type;

  const DashboardItem(
      {super.key,
      required this.name,
      required this.serialNumber,
      required this.currentProblems,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(children: [
        Center(child: Text(name)),
        Row(
          children: [Text(serialNumber.toString()), Text(currentProblems)],
        ),
        Text(type.toString())
      ]),
    );
  }
}
