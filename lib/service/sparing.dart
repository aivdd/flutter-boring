import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_boring/model/sparing.dart';

class SparingService {
  final CollectionReference sparingCollection =
      FirebaseFirestore.instance.collection('sparing');

  Future<void> addSparing(Sparing sparing) async {
    await sparingCollection.add(sparing.toFirestore());
  }

  Stream<List<Sparing>> getSparingsStream() {
    return sparingCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Sparing.fromFirestore(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>, null))
          .toList();
    });
  }

  Future<void> updateSparing(String docId, Sparing newSparing) async {
    await sparingCollection.doc(docId).update(newSparing.toFirestore());
  }

  Future<void> deleteSparing(String docId) async {
    await sparingCollection.doc(docId).delete();
  }
}
