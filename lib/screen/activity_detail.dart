import 'package:flutter/material.dart';
import 'package:flutter_boring/service/sparing.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_boring/model/sparing.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityDetail extends StatefulWidget {
  final String docId;
  ActivityDetail({Key? key, required this.docId}) : super(key: key);

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  // ignore: unused_field
  GoogleMapController? _mapController;
  SparingService sparingService = SparingService();
  late Future<Sparing?> sparingFuture;

  @override
  void initState() {
    super.initState();
    sparingFuture = _loadSparingData();
  }

  Future<Sparing?> _loadSparingData() async {
    return await sparingService.getSparingByDocId(widget.docId);
  }

  Future<void> _deleteSparing() async {
    try {
      await sparingService.deleteSparing(widget.docId);
      Navigator.pop(context, true);
    } catch (e) {
      print('Error deleting sparing: $e');
    }
  }

  Future<void> _navigationGoogleMaps(Sparing sparing) async {
    final latitude = double.parse(sparing.locationLat ?? "0.0");
    final longitude = double.parse(sparing.locationLng ?? "0.0");

    final url =
        "https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch Google Maps.');
    }
  }

  void _showBottomSheet(Sparing sparing) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 500,
          margin: EdgeInsets.fromLTRB(0, 25, 0, 5),
          color: Colors.white10,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        sparing.hostName ?? "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text("VS"),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        sparing.guestName ?? "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.history),
                          Text(
                            sparing.playingTime ?? "",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Informasi Sparing",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nomor Dokumen"),
                          Text(sparing.docId ?? ""),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Permainan"),
                          Text(sparing.olahraga ?? ""),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Taruhan"),
                          Text(sparing.harga ?? ""),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Informasi Lokasi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              sparing.locationAddress ?? "",
                            ),
                          ),
                          Icon(Icons.pin_drop)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 240,
                        child: ElevatedButton(
                          onPressed: () {
                            _deleteSparing();
                          },
                          child: Text("Hapus"),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 240,
                        child: ElevatedButton(
                          onPressed: () {
                            _navigationGoogleMaps(sparing);
                          },
                          child: Text("Navigation"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _hideBottomSheet() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 0, 46, 102),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<Sparing?>(
        future: sparingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text('Error loading data'),
            );
          } else {
            Sparing sparing = snapshot.data!;
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      double.parse(sparing.locationLat ?? "0.0"),
                      double.parse(sparing.locationLng ?? "0.0"),
                    ),
                    zoom: 15,
                  ),
                  markers: Set<Marker>.from([
                    Marker(
                      markerId: MarkerId("marker_id"),
                      position: LatLng(
                        double.parse(sparing.locationLat ?? "0.0"),
                        double.parse(sparing.locationLng ?? "0.0"),
                      ),
                      infoWindow:
                          InfoWindow(title: sparing.locationAddress ?? ""),
                    ),
                  ]),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  scrollGesturesEnabled: false,
                ),
                GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      _hideBottomSheet();
                    } else if (details.primaryVelocity! < 0) {
                      _showBottomSheet(sparing);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              size: 70,
                              color: Color.fromARGB(255, 0, 46, 102),
                            ),
                            Text(
                              "Details",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 0, 46, 102),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
