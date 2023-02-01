import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';

class ItemRepository {
  static final ItemRepository _instance = ItemRepository._internal();

  static ItemRepository get instance => _instance;

  static ItemRepository get I => _instance;

  ItemRepository._internal();

  final CollectionReference _itemCollection =
      FirebaseFirestore.instance.collection("items");

  Future<ItemMachine?> getItem(String? id) async {
    if (id == null) return null;
    final document = await _itemCollection.doc(id).get();
    return document.exists && null != document.data()
        ? ItemMachine.fromMap(document.data()! as Map<String, dynamic>)
            .copyWith(id: id)
        : null;
  }

  Future<DocumentReference> create({required ItemMachine itemMachine}) async {
    return _itemCollection.add(itemMachine.toMap());
  }

  Future<void> delete({required String id}) async {
    return _itemCollection.doc(id).delete();
  }

  Stream<List<ItemMachine>> get itemMachineStream =>
      _itemCollection.snapshots().map(
            (QuerySnapshot query) => query.docs
                .map((QueryDocumentSnapshot doc) {
                  // get data
                  final data = doc.data();
                  // if data is null return null
                  return data != null
                      ? ItemMachine.fromMap(data as Map<String, dynamic>)
                          .copyWith(id: doc.id)
                      : null;
                })
                // remove all null values
                .where((e) => e != null)
                // cast to not nullable list
                .cast<ItemMachine>()
                .toList(),
          );

  Future<List<ItemMachine>> getAll() async {
    final QuerySnapshot snapshot = await _itemCollection.get();
    return snapshot.docs
        .map((QueryDocumentSnapshot doc) {
          // get data
          final data = doc.data();
          // if data is null return null
          return data != null
              ? ItemMachine.fromMap(data as Map<String, dynamic>)
                  .copyWith(id: doc.id)
              : null;
        })
        // remove all null values
        .where((e) => e != null)
        // cast to not nullable list
        .cast<ItemMachine>()
        .toList();
  }
}
