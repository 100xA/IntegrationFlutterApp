import 'package:equatable/equatable.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';

class ItemListState extends Equatable {
  final bool loading;
  final String error;
  final String search;

  final List<ItemMachine> itemMachineList;

  const ItemListState({
    this.itemMachineList = const [],
    this.loading = false,
    this.error = "",
    this.search = "",
  });

  ItemListState copyWith({
    List<ItemMachine>? itemMachineList,
    bool? loading,
    String? error,
    String? search,
  }) {
    return ItemListState(
      itemMachineList: itemMachineList ?? this.itemMachineList,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      search: search ?? this.search,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        itemMachineList,
        loading,
        error,
        search,
      ];
}
