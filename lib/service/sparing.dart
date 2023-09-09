import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_boring/model/sparing.dart';

class SparingService {
  final CollectionReference sparingCollection =
      FirebaseFirestore.instance.collection('sparing');

  Stream<List<Sparing>> getSparingsStream() {
    return sparingCollection
        .orderBy("hostName", descending: false)
        .limit(10)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Sparing.fromFirestore(doc))
          .where((sparing) => sparing.guestName == null)
          .toList();
    });
  }

  Future<List<Sparing>> getSparingActivity() async {
    final querySnapshot =
        await sparingCollection.orderBy("playingTime", descending: false).get();
    return querySnapshot.docs
        .map((doc) {
          return Sparing.fromFirestore(doc);
        })
        .where((sparing) => sparing.guestName != null)
        .toList();
  }

  Future<Sparing?> getSparingByDocId(String docId) async {
    try {
      DocumentSnapshot snapshot = await sparingCollection.doc(docId).get();

      if (snapshot.exists) {
        return Sparing.fromFirestore(snapshot);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting sparing document: $e');
      return null;
    }
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
