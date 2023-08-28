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
        backgroundColor: Color.fromARGB(255, 14, 52, 84),
        title: Text('Cari Sparring'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
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
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.groups),
                        ),

                        SizedBox(width: 10),
                        Text(
                          'Pb NewJeans',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.calendar_today),
                        ),
                        SizedBox(width: 10),
                        Text(
                        'Jam 8 - 10',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.location_on),
                        ),
                        SizedBox(width: 10),
                        Text(
                        'GOR Winaraga, Bekasi, Jawa Barat',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.price_change),
                        ),
                        SizedBox(width: 10),
                        Text(
                        'Rp. 40.000',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton( 
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 14, 52, 84),
                        ),
                        child: Text('AJAK'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 1),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          
                          child: Icon(Icons.group_rounded),
                        ),

                        SizedBox(width: 10),
                        Text(
                          'Pb NewJeans',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.calendar_today),
                        ),
                        SizedBox(width: 10),
                        Text(
                        'Jam 11 - 12',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.location_on),
                        ),
                        SizedBox(width: 10),
                        Text(
                        'GOR Windah Batubara',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.price_change),
                        ),
                        SizedBox(width: 10),
                        Text(
                        'Rp. 20.000',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton( 
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 14, 52, 84),
                        ),
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
        backgroundColor: Color.fromARGB(255, 14, 52, 84), // Ubah warna latar belakang sesuai kebutuhan
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}