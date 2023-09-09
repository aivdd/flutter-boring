import 'package:flutter/material.dart';
import 'package:flutter_boring/screen/spar_ajak.dart';
import 'package:flutter_boring/screen/tambah_spar.dart';
import 'package:flutter_boring/service/sparing.dart';
import 'package:flutter_boring/model/sparing.dart';

class SparList extends StatefulWidget {
  const SparList({super.key});

  @override
  State<SparList> createState() => _SparListState();
}

class _SparListState extends State<SparList> {
  final SparingService _sparingService = SparingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 52, 84),
        title: Text('Cari Sparring', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder<List<Sparing>>(
        stream: _sparingService.getSparingsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("Tidak ada data sparing"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Sparing sparring = snapshot.data![index];
              return Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
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
                            sparring.hostName ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            ' | ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            sparring.olahraga ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
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
                            sparring.playingTime ?? '',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Icon(Icons.location_on),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              sparring.locationAddress ?? '',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
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
                            sparring.harga ?? '',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SparAjak(docId: sparring.docId!);
                              },
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 14, 52, 84),
                          ),
                          child: Text('AJAK',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahSpar()),
          ).then((result) {
            if (result == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sparing berhasil dibuat')),
              );
            }
          });
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 14, 52, 84),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
