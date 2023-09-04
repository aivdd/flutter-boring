import 'package:flutter/material.dart';
import 'package:flutter_boring/screen/activity_detail.dart';

import '../model/sparing.dart';
import '../service/sparing.dart';

class SparAjak extends StatefulWidget {
  final String docId;
  const SparAjak({required this.docId, Key? key}) : super(key: key);

  @override
  State<SparAjak> createState() => _SparAjakState();
}

class _SparAjakState extends State<SparAjak> {
  final TextEditingController guestNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 52, 84),
        title: Text('Ajak Sparing', style: TextStyle(color: Colors.white)),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    controller: guestNameController,
                    decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Nama Club / Komunitas',
                        hintText: "MiSi Sport 21"),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        _updateSparring(widget.docId);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 14, 52, 84),
                      ),
                      child:
                          Text('GAS!', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateSparring(String docId) async {
    String newGuestName = guestNameController.text;

    try {
      Sparing newSparing = Sparing(
        docId: docId,
        guestName: newGuestName,
      );

      await SparingService().updateSparing(docId, newSparing);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityDetail(docId: docId),
          ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update guest name: $error')),
      );
    }
  }
}
