import 'package:flutter/material.dart';

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
                            color: Color.fromARGB(255, 0, 46, 102),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 50, left: 40),
                              child: Text(
                                'Hallo, Antonn',
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
                                      borderRadius: const BorderRadius.all(
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
                                    child: const TextField(
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
                      const SizedBox(height: 20),
                      Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/ginting.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("CARI SPARING"),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 0, 46, 102),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
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
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        title: Text('Gor Gideon'),
                                        subtitle: Text('Ciangsana'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        title: Text('Taufik Hall'),
                                        subtitle: Text('Kelapa dua wetan'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        title: Text('Fajar Hall'),
                                        subtitle: Text('Bandung'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        title: Text('Venue 2'),
                                        subtitle: Text('Subtitle 2'),
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
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        leading: CircleAvatar(child: Text('B')),
                                        title: Text('Bekasi Club'),
                                        subtitle: Text('Bekasi'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        leading: CircleAvatar(child: Text('J')),
                                        title: Text('Jakarta Club'),
                                        subtitle: Text('Jakarta'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 160,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        leading: CircleAvatar(child: Text('B')),
                                        title: Text('Bogor Club'),
                                        subtitle: Text('Bogor'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    width: 260,
                                    height: 120,
                                    child: Card(
                                      color: Colors.grey[300],
                                      child: ListTile(
                                        leading: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'images/gideon.jpg'),
                                            ),
                                          ),
                                        ),
                                        title: Text('Depok Club'),
                                        subtitle: Text('Depok'),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
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
                    ], // <-- Missing closing bracket
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
