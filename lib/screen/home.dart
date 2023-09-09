import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_boring/screen/kayuma.dart';
import 'ferry.dart';
import 'taufik.dart';
import 'gideon.dart';
import 'package:flutter_boring/screen/spar_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 160,
                            color: Color.fromARGB(255, 1, 35, 86),
                            child: Padding(
                              padding: EdgeInsets.only(top: 50, left: 40),
                              child: Text(
                                'Hallo CUKURUKUKUKKK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35.0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        prefixIcon: Icon(Icons.search),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(horizontal: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/images/ginting.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 35.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Buat Pindah Halaman
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SparList();
                                },
                              ),
                            );
                          },
                          child: Text("CARI SPARING"),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 46, 102),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 300,
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Venue Recommendations',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_circle_right,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => DetailPage()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 200,
                                      child: Card(
                                        color: Colors.grey[300],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Gambar
                                            Container(
                                              width: 120,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      'assets/images/gideon.jpg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Gor Gideon',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Ciangsana',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              'Mulai Dari Rp. 50.000',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: const Color.fromARGB(
                                                    255, 2, 2, 2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TaufikDetail()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 200,
                                      child: Card(
                                        color: Colors.grey[300],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Gambar
                                            Container(
                                              width: 130,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      'assets/images/gor1.jpeg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Taufik Arena',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Cibubur',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              'Mulai Dari Rp. 40.000',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: const Color.fromARGB(
                                                    255, 2, 2, 2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => KayumaPage()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 200,
                                      child: Card(
                                        color: Colors.grey[300],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Gambar
                                            Container(
                                              width: 140,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      'assets/images/jatiasih.jpeg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Gor Kayuma',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Jatiasih',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              'Mulai Dari Rp. 35.000',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: const Color.fromARGB(
                                                    255, 2, 2, 2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => FerryPage()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 200,
                                      child: Card(
                                        color: Colors.grey[300],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Gambar
                                            Container(
                                              width: 140,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      'assets/images/gideon2.jpg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Gor Ferry Jaya',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Cipendawa',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              'Mulai Dari Rp. 40.000',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: const Color.fromARGB(
                                                    255, 2, 2, 2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add more containers for additional cards...
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Community Recommendations',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_circle_right,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20.0)),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Bekasi Club',
                                                    style: TextStyle(
                                                        fontSize: 30)),
                                                SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 0, 55, 100)),
                                                    SizedBox(width: 4),
                                                    Text('Jatiasih, Bekasi'),
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(Icons.phone,
                                                        color: Color.fromRGBO(
                                                            3,
                                                            44,
                                                            78,
                                                            1)), // Tambahkan ikon telepon
                                                    SizedBox(width: 4),
                                                    Text(
                                                        '085775064435'), // Tambahkan teks nomor telepon
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'Deskripsi: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                                                ),
                                                SizedBox(height: 16),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Untuk menutup modal
                                                  },
                                                  child: Text(
                                                    'Tutup',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                    ), // Warna teksnya menjadi merah
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255,
                                                        10,
                                                        0,
                                                        115), // Warna latar belakang tetap putih
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 120,
                                      child: Card(
                                        color: Colors.grey[300],
                                         child: ListTile(
                                          leading:
                                              CircleAvatar(child: Text('B')),
                                          title: Text('Bekasi Club'),
                                          subtitle: Text('Bekasi'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20.0)),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('BIU CLUB',
                                                    style: TextStyle(
                                                        fontSize: 30)),
                                                SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on,
                                                        color: Colors.blue),
                                                    SizedBox(width: 4),
                                                    Text(
                                                        'Lokasi: Rawa Lumbu, Bekasi'),
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'Deskripsi: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                                                ),
                                                SizedBox(height: 16),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Untuk menutup modal
                                                  },
                                                  child: Text(
                                                    'Tutup',
                                                    style: TextStyle(
                                                        color: const Color
                                                                .fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255)), // Warna teksnya menjadi merah
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255,
                                                        10,
                                                        0,
                                                        115), // Warna latar belakang tetap putih
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 120,
                                      child: Card(
                                        color: Colors.grey[300],
                                        child: ListTile(
                                          leading:
                                              CircleAvatar(child: Text('B')),
                                          title: Text('Bekasi Club'),
                                          subtitle: Text('Lokasi: Bekasi'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20.0)),
                                        ),
                                        builder: (BuildContext context) {
                                          return Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Bekasi Club',
                                                    style: TextStyle(
                                                        fontSize: 30)),
                                                SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 0, 55, 100)),
                                                    SizedBox(width: 4),
                                                    Text('Jatiasih, Bekasi'),
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(Icons.phone,
                                                        color: Color.fromRGBO(
                                                            3,
                                                            44,
                                                            78,
                                                            1)), // Tambahkan ikon telepon
                                                    SizedBox(width: 4),
                                                    Text(
                                                        '085775064435'), // Tambahkan teks nomor telepon
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'Deskripsi: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                                                ),
                                                SizedBox(height: 16),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Untuk menutup modal
                                                  },
                                                  child: Text(
                                                    'Tutup',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                    ), // Warna teksnya menjadi merah
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255,
                                                        10,
                                                        0,
                                                        115), // Warna latar belakang tetap putih
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 160,
                                      height: 120,
                                      child: Card(
                                        color: Colors.grey[300],
                                        child: ListTile(
                                          leading:
                                              CircleAvatar(child: Text('B')),
                                          title: Text('Bekasi Club'),
                                          subtitle: Text('Lokasi: Bekasi'),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Add more containers for additional cards...
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
