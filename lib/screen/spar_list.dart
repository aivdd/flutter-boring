import 'package:flutter/material.dart';

class SparList extends StatefulWidget {
  const SparList({super.key});

  @override
  State<SparList> createState() => _SparListState();
}

class _SparListState extends State<SparList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Sparring'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: Image(image:AssetImage("image/kecil1.jpeg")),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Pb NewJeans',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jam 8 sampai 10',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('AJAK'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.green,
                          child: Image(image:AssetImage("image/kecil1.jpeg")),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'PB NewJeans',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jam 8 - 10',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('AJAK'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi yang dijalankan saat tombol tambah ditekan
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Ubah warna latar belakang sesuai kebutuhan
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}