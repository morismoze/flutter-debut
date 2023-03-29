import 'package:debutapp/services/firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

/* 
* This is the main class access/call for any UI widgets that require to perform
* any CRUD activities operation in FirebaseFirestore database.
* This class work hand-in-hand with FirestoreService and FirestorePath. 
*/
class FirestoreDatabase {
  FirestoreDatabase({required this.uid});

  final String uid;

  final _firestoreService = FirestoreService.instance;
}
