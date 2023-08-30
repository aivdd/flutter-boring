import 'package:cloud_firestore/cloud_firestore.dart';

class Sparing {
  final String? docId;
  final String? hostName;
  final String? playingTime;
  final String? location;
  final String? guestName;

  Sparing({
    this.docId,
    this.hostName,
    this.playingTime,
    this.location,
    this.guestName,
  });

  factory Sparing.fromFirestore(
    DocumentSnapshot snapshot,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Sparing(
      docId: snapshot.id,
      hostName: data['hostName'],
      playingTime: data['playingTime'],
      location: data['location'],
      guestName: data['guestName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (hostName != null) "hostName": hostName,
      if (playingTime != null) "playingTime": playingTime,
      if (location != null) "location": location,
      "guestName": guestName,
    };
  }
}
