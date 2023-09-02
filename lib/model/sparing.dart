import 'package:cloud_firestore/cloud_firestore.dart';

class Sparing {
  final String? docId;
  final String? hostName;
  final String? olahraga;
  final String? playingTime;
  final String? location;
  final String? harga;
  final String? guestName;

  Sparing({
    this.docId,
    this.hostName,
    this.olahraga,
    this.playingTime,
    this.location,
    this.harga,
    this.guestName,
  });

  factory Sparing.fromFirestore(
    DocumentSnapshot snapshot,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Sparing(
      docId: snapshot.id,
      hostName: data['hostName'],
      olahraga: data['olahraga'],
      playingTime: data['playingTime'],
      location: data['location'],
      harga: data['harga'],
      guestName: data['guestName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (hostName != null) "hostName": hostName,
      if (olahraga != null) "olahraga": olahraga,
      if (playingTime != null) "playingTime": playingTime,
      if (location != null) "location": location,
      if (harga != null) "harga": harga,
      "guestName": guestName,
    };
  }
}
