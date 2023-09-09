import 'package:cloud_firestore/cloud_firestore.dart';

class Sparing {
  final String? docId;
  final String? hostName;
  final String? olahraga;
  final String? playingTime;
  final String? locationLat;
  final String? locationLng;
  final String? locationAddress;
  final String? harga;
  final String? guestName;

  Sparing({
    this.docId,
    this.hostName,
    this.olahraga,
    this.playingTime,
    this.locationLat,
    this.locationLng,
    this.locationAddress,
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
      locationLat: data['locationLat'],
      locationLng: data['locationLng'],
      locationAddress: data['locationAddress'],
      harga: data['harga'],
      guestName: data['guestName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (hostName != null) "hostName": hostName,
      if (olahraga != null) "olahraga": olahraga,
      if (playingTime != null) "playingTime": playingTime,
      if (locationLat != null) "locationLat": locationLat,
      if (locationLng != null) "locationLng": locationLng,
      if (locationAddress != null) "locationAddress": locationAddress,
      if (harga != null) "harga": harga,
      "guestName": guestName,
    };
  }
}
