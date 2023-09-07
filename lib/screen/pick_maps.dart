import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:location/location.dart';

class PickMaps extends StatefulWidget {
  const PickMaps();

  @override
  State<PickMaps> createState() => _PickMapsState();
}

class _PickMapsState extends State<PickMaps> {
  double latitude = -6.175247;
  double longitude = 106.8270488;

  @override
  void initState() {
    super.initState();
    // Panggil getCurrentLocation() pada saat initState untuk mendapatkan lokasi saat ini.
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      var currentLocation = await location.getLocation();
      setState(() {
        latitude = currentLocation.latitude!;
        longitude = currentLocation.longitude!;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenStreetMapSearchAndPick(
          center: LatLong(latitude, longitude),
          buttonColor: Color.fromARGB(255, 0, 46, 102),
          locationPinIconColor: Colors.red,
          locationPinText: "",
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.addressName);
            List<String> pickedMaps = [
              pickedData.latLong.latitude.toString(),
              pickedData.latLong.longitude.toString(),
              pickedData.addressName,
            ];
            Navigator.pop(context, pickedMaps);
          },
        ),
      ),
    );
  }
}
