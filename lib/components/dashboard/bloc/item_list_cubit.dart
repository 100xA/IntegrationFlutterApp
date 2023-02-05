import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_detail_cubit.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item_repository.dart';
import 'package:integration_flutter_app/components/dashboard/ui/item_detail_screen.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit() : super(const ItemListState());

  final ItemRepository _itemRepository = ItemRepository.I;

  StreamSubscription? _itemMachineSubscription;

  // inits the Cubit for the Subscription
  Future<void> initialize() async {
    emit(state.copyWith(error: "", loading: true));
    initItemMachines((p0) => null);
    emit(state.copyWith(loading: false));
  }

  // Subscribes to potential changes
  void initItemMachines(Function(List<ItemMachine>) callBack) {
    _itemMachineSubscription?.cancel();
    _itemMachineSubscription =
        _itemRepository.itemMachineStream.listen((itemMachineList) {
      callBack(itemMachineList);
      emit(state.copyWith(itemMachineList: itemMachineList));
    });
  }

  // Create test Event on Startup - needs to be activated during the startup process
  Future<void> createSimpleEventonStartup() async {
    await _itemRepository.create(
        itemMachine: const ItemMachine(
      name: "TestMachine",
      serialNumber: 69420,
      currentProblems: "No Problems",
      machine: 2,
    ));
  }

  // opens an ItemMachine in the Dashboard menu
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
