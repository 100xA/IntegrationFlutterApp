import 'package:equatable/equatable.dart';

import '../repo/item.dart';

/// Describes the state of ItemMachine object found in [item.dart]

class ItemDetailState extends Equatable {
  final ItemMachine itemMachine;

  const ItemDetailState({
    required this.itemMachine,
  });

  ItemDetailState copyWith({
    ItemMachine? itemMachine,
  }) {
    return ItemDetailState(itemMachine: itemMachine ?? this.itemMachine);
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [itemMachine];
}
