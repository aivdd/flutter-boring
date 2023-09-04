import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: TaufikDetail(),
  ));
}

class TaufikDetail extends StatefulWidget {
  const TaufikDetail({Key? key});

  @override
  State<TaufikDetail> createState() => _TaufikDetailState();
}

class _TaufikDetailState extends State<TaufikDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Taufik Hidayat Arena',
                style: TextStyle(fontSize: 20)), // Your main title
            Text(
              'Jakarta Timur',
              style: TextStyle(
                fontSize: 16.0, // Adjust the font size as needed
                color: Colors.white, // Adjust the text color as needed
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 46, 102),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Card(
                elevation: 4,
                color: const Color.fromARGB(255, 255, 255, 255),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/gor1.jpeg'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Taufik Hidayat Arena',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Jl. Raya Pkp No.8, RT.7/RW.12, Cibubur, Kec. Ciracas, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13720',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Mulai Dari Rp. 40.000',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CardWithIcons(
              icon: Icons.restaurant,
              text: 'Food',
              facilityText: 'Fasilitas', // Teks "Fasilitas"
              facilityTextStyle: TextStyle(fontSize: 20), // Ganti ukuran teks
              textStyle: TextStyle(fontSize: 18),
              nextText: 'Drink',
              nextIcon: Icons.local_drink,
              nextTextStyle: TextStyle(fontSize: 18),
              parkingIcon: Icons.motorcycle,
              parkingText: 'Parking',
              gymText: 'Gym',
              gymIcon: Icons.fitness_center,
            ),
            SizedBox(height: 20),
            GestureDetector(
              // Wrap the GoogleMap with GestureDetector
              onVerticalDragUpdate: (_) {}, // Prevent vertical scrolling
              child: Padding(
                padding: EdgeInsets.all(16.0), // Adjust padding as needed
                child: Card(
                  elevation: 4.0, // Adjust elevation as needed
                  child: Container(
                    width: double.infinity, // Adjust width as needed
                    height: 300.0, // Adjust height as needed
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              -6.355924335883751,
                              106.95498093497488,
                            ), // Koordinat San Francisco
                            zoom: 15,
                          ),
                          markers: Set<Marker>.from([
                            Marker(
                              markerId: MarkerId("marker_id"),
                              position: LatLng(
                                -6.355924335883751,
                                106.95498093497488,
                              ),
                              infoWindow: InfoWindow(title: "Marker Title"),
                            ),
                          ]),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding:
                                EdgeInsets.all(8.0), // Adjust padding as needed
                            color: const Color.fromARGB(255, 0, 46,
                                102), // Adjust the background color as needed
                            child: Text(
                              'Lokasi',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWithIcons extends StatelessWidget {
  final String text;
  final IconData icon;
  final String? nextText;
  final IconData? nextIcon;
  final String? parkingText;
  final IconData? parkingIcon;
  final String? gymText;
  final IconData? gymIcon;
  final String? facilityText; // Teks "Fasilitas"
  final TextStyle? facilityTextStyle; // Ganti ukuran teks "Fasilitas"
  final double? rating;
  final TextStyle? textStyle;
  final TextStyle? nextTextStyle;

  const CardWithIcons({
    required this.text,
    required this.icon,
    this.nextText,
    this.nextIcon,
    this.parkingText,
    this.parkingIcon,
    this.gymText,
    this.gymIcon,
    this.facilityText,
    this.facilityTextStyle,
    this.rating,
    this.textStyle,
    this.nextTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20), // Margin kiri dan kanan
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (facilityText != null)
              Padding(
                padding: EdgeInsets.only(bottom: 10), // Tambahkan jarak bawah
                child: Text(
                  facilityText!,
                  style: facilityTextStyle ?? TextStyle(),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Menyusun teks dan ikon di kanan
              children: [
                Row(
                  children: [
                    Icon(icon),
                    SizedBox(width: 10),
                    Text(
                      text,
                      style: textStyle ?? TextStyle(),
                    ),
                  ],
                ),
                if (parkingText != null && parkingIcon != null)
                  Row(
                    children: [
                      Text(
                        parkingText!,
                        style: nextTextStyle ?? TextStyle(),
                      ),
                      SizedBox(width: 5),
                      Icon(parkingIcon),
                    ],
                  ),
                if (gymText != null && gymIcon != null)
                  Row(
                    children: [
                      Text(
                        gymText!,
                        style: nextTextStyle ?? TextStyle(),
                      ),
                      SizedBox(width: 5),
                      Icon(gymIcon),
                    ],
                  ),
              ],
            ),
            if (rating != null)
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            if (nextText != null && nextIcon != null) SizedBox(height: 10),
            Row(
              children: [
                Icon(nextIcon),
                SizedBox(width: 10),
                Text(
                  nextText!,
                  style: nextTextStyle ?? TextStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
