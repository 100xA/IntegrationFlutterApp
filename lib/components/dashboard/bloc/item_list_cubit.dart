import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_detail_cubit.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_state.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item_repository.dart';
import 'package:integration_flutter_app/components/dashboard/ui/item_detail_screen.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit() : super(const ItemListState());

  final ItemRepository _itemRepository = ItemRepository.I;

  StreamSubscription? _itemMachineSubscription;

  /// initiliazes the [ItemListCubit] for the Subscription
  Future<void> initialize() async {
    emit(state.copyWith(error: "", loading: true));

    initItemMachines((p0) => null);

    emit(state.copyWith(loading: false));
  }

  /// Subscribe to [ItemMachineStream] to initiate all [ItemMachines]
  void initItemMachines(Function(List<ItemMachine>) callBack) {
    _itemMachineSubscription?.cancel();
    _itemMachineSubscription =
        _itemRepository.itemMachineStream.listen((itemMachineList) {
      callBack(itemMachineList);
      emit(state.copyWith(itemMachineList: itemMachineList));
    });
  }

  /// Create simple [ItemMachine] - not production code
  Future<void> createSimpleItemMachineOnStartup() async {
    await _itemRepository.create(
      itemMachine: ItemMachine(
        name: "Trumpf - EHT TrumaBend S 85 - 25",
        serialNumber: 8525,
        currentProblems: "No Problems",
        machine: 2,
        purchaseTime: Timestamp.fromDate(DateTime.utc(2009)),
        inspectionTime: Timestamp.fromDate(DateTime.utc(2022, 09, 20)),
        place: "Halle 1",
      ),
    );
    await _itemRepository.create(
        itemMachine: ItemMachine(
      name: "CNC Stanz- und Nibbelmaschine",
      serialNumber: 100030,
      currentProblems: "No Problems",
      machine: 2,
      purchaseTime: Timestamp.fromDate(DateTime.utc(2009)),
      inspectionTime: Timestamp.fromDate(DateTime.utc(2020, 09, 20)),
      place: "Halle 1",
    ));
  }

  /// reverts [int] machineType to specific description
  String machineTypeFilter(int? id) {
    switch (id) {
      case 1:
        return "Printer";
      case 2:
        return "Sorter Machine";
      default:
        return "Other Machine";
    }
  }

  /// Opens an [ItemMachine] in [IntegrationDashboard]
  Future<void> openItem(
      final ItemMachine itemMachine, BuildContext context) async {
    final ItemDetailCubit itemDetailCubit = ItemDetailCubit(itemMachine);

    final page = BlocProvider<ItemDetailCubit>.value(
      value: itemDetailCubit..initialize(),
      child: ItemDetailScreen(itemDetailCubit),
    );
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }
}
