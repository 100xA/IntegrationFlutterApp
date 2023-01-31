import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';
import 'package:integration_flutter_app/misc/design/colors.dart';

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

  String _checkCurrentProblems(String currentProblems) {
    return currentProblems.isEmpty ? "Keine Probleme zurzeit" : currentProblems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(image: AssetImage("assets/img/test-drucker.webp")),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: $name",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Nummer: $serialNumber",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Art: $type",
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "Aktuelle Probleme: ${_checkCurrentProblems(currentProblems)}",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
