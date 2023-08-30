import 'package:cloud_firestore/cloud_firestore.dart';

class Sparing {
  final String? hostName;
  final String? playingTime;
  final String? location;
  final String? guestName;

  Sparing({
    this.hostName,
    this.playingTime,
    this.location,
    this.guestName,
  });

  factory Sparing.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Sparing(
      hostName: data?['hostName'],
      playingTime: data?['playingTime'],
      location: data?['location'],
      guestName: data?['guestName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (hostName != null) "hostName": hostName,
      if (playingTime != null) "playingTime": playingTime,
      if (location != null) "location": location,
      if (guestName != null) "guestName": guestName,
    };
  }
}
