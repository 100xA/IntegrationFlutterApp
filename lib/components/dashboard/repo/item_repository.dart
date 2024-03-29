import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:integration_flutter_app/components/dashboard/repo/item.dart';

class ItemRepository {
  static final ItemRepository _instance = ItemRepository._internal();

  /// Getter Singleton Instance of [ItemRepository]
  static ItemRepository get instance => _instance;

  static ItemRepository get I => _instance;

  /// Internal Constructor
  ItemRepository._internal();

  /// Instantiate FirebaseCollection from Firebase in [items]
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

  /// create [ItemMachine] Document
  Future<DocumentReference> create({required ItemMachine itemMachine}) async {
    return _itemCollection.add(itemMachine.toMap());
  }

  /// delete [ItemMachine] Document based on id
  Future<void> delete({required String id}) async {
    return _itemCollection.doc(id).delete();
  }

  /// [ItemMachineStream] that pushes/listens to every stream
  Stream<List<ItemMachine>> get itemMachineStream =>
      _itemCollection.snapshots().map(
            (QuerySnapshot query) => query.docs
                .map((QueryDocumentSnapshot doc) {
                  final data = doc.data();
                  return data != null
                      ? ItemMachine.fromMap(data as Map<String, dynamic>)
                          .copyWith(id: doc.id)
                      : null;
                })
                .where((e) => e != null)
                .cast<ItemMachine>()
                .toList(),
          );

  /// transform [ItemMachine] into a list
  Future<List<ItemMachine>> getAll() async {
    final QuerySnapshot snapshot = await _itemCollection.get();
    return snapshot.docs
        .map((QueryDocumentSnapshot doc) {
          final data = doc.data();
          return data != null
              ? ItemMachine.fromMap(data as Map<String, dynamic>)
                  .copyWith(id: doc.id)
              : null;
        })
        .where((e) => e != null)
        .cast<ItemMachine>()
        .toList();
  }
}
