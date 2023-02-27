import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_flutter_app/components/dashboard/bloc/item_detail_state.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';

class ItemDetailCubit extends Cubit<ItemDetailState> {
  ItemDetailCubit(ItemMachine itemMachine)
      : super(ItemDetailState(itemMachine: itemMachine));

  /// initialize the specific [ItemMachine] to be opened with [openItem] int [ItemListCubit]
  Future<void> initialize() async {
    emit(state.copyWith(itemMachine: state.itemMachine));
  }
}
