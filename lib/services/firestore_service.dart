import 'package:cloud_firestore/cloud_firestore.dart';

/*
* This class represent all possible CRUD operation for FirebaseFirestore.
* It contains all generic implementation needed based on the provided document
* path and documentID,since most of the time in FirebaseFirestore design, we will have
* documentID and path for any document and collections.
*/
class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> set({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.delete();
  }
}
