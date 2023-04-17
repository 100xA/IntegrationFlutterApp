import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_cubit.dart';

import 'package:integration_flutter_app/misc/design/colors.dart';

import '../../components/dashboard/repo/item.dart';
import '../../core/services/service_locator.dart';

/// Machine item for the [IntegrationDashboard]

class IntegrationDashboardItem extends StatelessWidget {
  final ItemMachine itemMachine;

  const IntegrationDashboardItem({super.key, required this.itemMachine});

  String _checkCurrentProblems(String currentProblems) {
    return currentProblems.isEmpty ? "Keine Probleme zurzeit" : currentProblems;
  }

  @override
  Widget build(BuildContext context) {
    final ItemListCubit itemListCubit = app.get<ItemListCubit>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => app.get<ItemListCubit>().openItem(itemMachine, context),
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
                      "Name: ${itemMachine.name}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Nummer: ${itemMachine.serialNumber}",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Art: ${itemListCubit.machineTypeFilter(itemMachine.machine)}",
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
                  "Aktuelle Probleme: ${_checkCurrentProblems(itemMachine.currentProblems!)}",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
