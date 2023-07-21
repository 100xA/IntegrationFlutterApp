import 'package:equatable/equatable.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';

/// Describes the state of all ItemMachines found in [IntegrationDashboard]
class ItemListState extends Equatable {
  /// State used for future adaption of loading widgets in case [ItemMachineList] loads slowly
  final bool loading;

  /// String to catch error from loading data from [ItemMachineList]
  final String error;

  final List<ItemMachine> itemMachineList;

  const ItemListState({
    this.itemMachineList = const [],
    this.loading = false,
    this.error = "",
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
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        itemMachineList,
        loading,
        error,
      ];
}
