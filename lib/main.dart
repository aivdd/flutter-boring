import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_boring/screen/history.dart';
import 'package:flutter_boring/screen/home.dart';
import 'package:flutter_boring/screen/spar_list.dart';
import 'package:flutter_boring/screen/tambah_spar.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      home: MyBottomTabBar(),
    );
  }
}

class MyBottomTabBar extends StatefulWidget {
  @override
  _MyBottomTabBarState createState() => _MyBottomTabBarState();
}

class _MyBottomTabBarState extends State<MyBottomTabBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TambahSpar(),
    SparList(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 0, 46, 102),
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histori',
          ),
        ],
      ),
    );
  }
}
