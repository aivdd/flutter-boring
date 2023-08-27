import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          color: Colors.blue[900], // Warna biru tua
          child: Align(
            alignment: Alignment.centerLeft, // Penempatan di atas dan kiri
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 16.0), // Menambah jarak atas
              child: Text(
                'Hallo, XYZ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 10.0, left: 5.0, right: 5.0), // Menambah margin atas
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
