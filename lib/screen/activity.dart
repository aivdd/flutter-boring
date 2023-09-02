import 'package:flutter/material.dart';
import 'package:flutter_boring/model/sparing.dart';
import 'package:flutter_boring/screen/activity_detail.dart';
import 'package:flutter_boring/service/sparing.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<Sparing> sparingList = [];

  @override
  void initState() {
    super.initState();
    _loadSparingData();
  }

  void _loadSparingData() async {
    final sparingService = SparingService();
    final sparingData = await sparingService.getSparingActivity();
    setState(() {
      sparingList = sparingData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sparing Activity'),
        backgroundColor: Color.fromARGB(255, 0, 46, 102),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black12,
      body: ListView.builder(
        itemCount: sparingList.length,
        itemBuilder: (context, index) {
          final sparing = sparingList[index];
          return GestureDetector(
            onTap: () {
              _activityDetail(sparing);
            },
            child: Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              elevation: 5,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      width: 100,
                      child: Text(
                        sparing.hostName ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 125,
                      child: Column(
                        children: [
                          const Text(
                            'VS',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            sparing.playingTime ?? '',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 100,
                      child: Text(
                        sparing.guestName ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _activityDetail(Sparing sparing) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ActivityDetail(docId: sparing.docId!),
        ));
    print('Card clicked: ${sparing.docId}');
  }
}
