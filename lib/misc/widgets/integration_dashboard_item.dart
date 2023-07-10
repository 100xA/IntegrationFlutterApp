import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_cubit.dart';

import 'package:integration_flutter_app/misc/design/colors.dart';

import '../../components/dashboard/repo/item.dart';
import '../../core/services/service_locator.dart';

/// Machine item for the [IntegrationDashboard]

class IntegrationDashboardItem extends StatelessWidget {
  final ItemMachine itemMachine;
  final String picture;

  const IntegrationDashboardItem(
      {super.key, required this.itemMachine, required this.picture});

  String _checkCurrentProblems(String currentProblems) {
    return currentProblems.isEmpty ? "Keine Probleme zurzeit" : currentProblems;
  }

  @override
  Widget build(BuildContext context) {
    final ItemListCubit itemListCubit = app.get<ItemListCubit>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Image(image: AssetImage(picture)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "Aktuelle Probleme: ${_checkCurrentProblems(itemMachine.currentProblems!)}",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
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
                      "Name: ${itemMachine.name}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Art: ${itemListCubit.machineTypeFilter(itemMachine.machine)}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Nummer: ${itemMachine.serialNumber}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Kaufdatum: ${itemMachine.purchaseTime?.toDate().year}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Letzte Instandhaltung: ${itemMachine.inspectionTime?.toDate()}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Standort: ${itemMachine.place}",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Störungsbeseitigung/Reperatur"),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Ersatzteile"),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {
                    app.get<ItemListCubit>().openItem(itemMachine, context);
                  },
                  child: const Text("Instandhaltung durchführen"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
