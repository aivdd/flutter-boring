import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_boring/model/sparing.dart';

class SparingService {
  final CollectionReference sparingCollection =
      FirebaseFirestore.instance.collection('sparing');

  Stream<List<Sparing>> getSparingsStream() {
    return sparingCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Sparing.fromFirestore(doc))
          .where((sparing) => sparing.guestName == null)
          .toList();
    });
  }

  Future<List<Sparing>> getSparingActivity() async {
    final querySnapshot = await sparingCollection.get();
    return querySnapshot.docs
        .map((doc) {
          return Sparing.fromFirestore(doc);
        })
        .where((sparing) => sparing.guestName != null)
        .toList();
  }

  Future<void> addSparing(Sparing sparing) async {
    await sparingCollection.add(sparing.toFirestore());
  }

  Future<void> updateSparing(String docId, Sparing newSparing) async {
    await sparingCollection.doc(docId).update(newSparing.toFirestore());
  }

  Future<void> deleteSparing(String docId) async {
    await sparingCollection.doc(docId).delete();
  }
}
