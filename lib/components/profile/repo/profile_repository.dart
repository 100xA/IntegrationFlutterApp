import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:integration_flutter_app/components/profile/repo/profile.dart';

class ProfileRepository {
  static final ProfileRepository _instance = ProfileRepository._internal();

  // Getter Singleton Instance of ProfileRepo
  static ProfileRepository get instance => _instance;

  static ProfileRepository get I => _instance;

  // Internal Constructor
  ProfileRepository._internal();

  final CollectionReference _profileCollection =
      FirebaseFirestore.instance.collection("profile");

  Future<Profile?> getProfile(String? id) async {
    if (id == null) return null;
    final document = await _profileCollection.doc(id).get();
    return document.exists && null != document.data()
        ? Profile.fromMap(document.data()! as Map<String, dynamic>)
            .copyWith(id: id)
        : null;
  }

  Future<DocumentReference> create({required Profile profile}) async {
    return _profileCollection.add(profile.toMap());
  }

  Future<void> delete({required String id}) async {
    return _profileCollection.doc(id).delete();
  }

  Stream<List<Profile>> get itemMachineStream =>
      _profileCollection.snapshots().map(
            (QuerySnapshot query) => query.docs
                .map((QueryDocumentSnapshot doc) {
                  // get data
                  final data = doc.data();
                  // if data is null return null
                  return data != null
                      ? Profile.fromMap(data as Map<String, dynamic>)
                          .copyWith(id: doc.id)
                      : null;
                })
                // remove all null values
                .where((e) => e != null)
                // cast to not nullable list
                .cast<Profile>()
                .toList(),
          );

  // getAll Profiles in a List
  Future<List<Profile>> getAll() async {
    final QuerySnapshot snapshot = await _profileCollection.get();
    return snapshot.docs
        .map((QueryDocumentSnapshot doc) {
          // get data
          final data = doc.data();
          // if data is null return null
          return data != null
              ? Profile.fromMap(data as Map<String, dynamic>)
                  .copyWith(id: doc.id)
              : null;
        })
        // remove all null values
        .where((e) => e != null)
        // cast to not nullable list
        .cast<Profile>()
        .toList();
  }
}
