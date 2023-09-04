import 'package:flutter/material.dart';

class ActivityDetail extends StatefulWidget {
  final String docId;
  ActivityDetail({Key? key, required this.docId}) : super(key: key);

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 46, 102),
        foregroundColor: Colors.white,
        title: Text('Detail Activity - ${widget.docId}'),
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
      body: const Placeholder(),
    );
  }
}
