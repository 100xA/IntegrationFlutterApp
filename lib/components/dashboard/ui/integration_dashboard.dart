import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_cubit.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';
import 'package:integration_flutter_app/misc/widgets/dashboard_item.dart';
import 'package:integration_flutter_app/misc/widgets/integration_dashboard_drawer.dart';

import '../../../core/services/service_locator.dart';
import '../bloc/item_list_state.dart';

class IntegrationDashboard extends StatelessWidget {
  final ItemListCubit _itemListCubit = app.get<ItemListCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListCubit, ItemListState>(
      builder: (_, state) => Scaffold(
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
                  final ItemMachine itemMachine = state.itemMachineList[index];

                  return DashboardItem(
                      name: itemMachine.name!,
                      serialNumber: itemMachine.serialNumber!,
                      currentProblems: itemMachine.currentProblems!,
                      type: itemMachine.machine!);
                }),
                itemCount: state.itemMachineList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
