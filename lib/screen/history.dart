import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List names = [
    "Gor Berdikari",
    "Gor Olympus",
    "Gor Sayan",
    "Gor Olympus",
    "Gor Sayan",
    "Gor Berdikari",
    "Gor Olympus",
    "Gor Sayan",
    "Gor Berdikari",
  ];
  List designations = [
    "Bulutangkis",
    "Bulutangkis",
    "Futsal",
    "Bulutangkis",
    "Futsal",
    "Bulutangkis",
    "Bulutangkis",
    "Futsal",
    "Bulutangkis"
  ];
  List tittle = [
    "Menang",
    "Kalah",
    "Menang",
    "Kalah",
    "Menang",
    "Kalah",
    "Menang",
    "Kalah",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                              "https://asset.kompas.com/crops/NdFZR4De7xPg7K04QSzPWRCrKLg=/10x0:915x603/750x500/data/photo/2021/11/12/618e70119b754.jpeg"),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(names[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                          Text(designations[index],
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child:
                        Text("Menang", style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
