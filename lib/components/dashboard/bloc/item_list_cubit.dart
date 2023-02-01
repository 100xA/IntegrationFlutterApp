import 'dart:async';

import 'package:integration_flutter_app/components/dashboard/bloc/item_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item_repository.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit() : super(const ItemListState());

  final ItemRepository _itemRepository = ItemRepository.I;

  StreamSubscription? _itemMachineSubscription;

  Future<void> initialize() async {
    emit(state.copyWith(error: "", loading: true));
    initItemMachines((p0) => null);
    emit(state.copyWith(loading: false));
  }

  void initItemMachines(Function(List<ItemMachine>) callBack) {
    _itemMachineSubscription?.cancel();
    _itemMachineSubscription =
        _itemRepository.itemMachineStream.listen((itemMachineList) {
      callBack(itemMachineList);
      emit(state.copyWith(itemMachineList: itemMachineList));
    });
  }

  Future<void> createSimpleEventonStartup() async {
    await _itemRepository.create(
        itemMachine: const ItemMachine(
      name: "TestMachine",
      serialNumber: 69420,
      currentProblems: "No Problems",
      machine: 2,
    ));
  }
}
