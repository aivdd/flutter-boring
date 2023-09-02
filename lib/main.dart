import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_boring/screen/activity.dart';
import 'package:flutter_boring/screen/home.dart';
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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 46, 102)),
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
    Home(),
    Activity(),
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
        unselectedItemColor: Color.fromARGB(255, 132, 130, 130),
        backgroundColor: Color.fromARGB(255, 0, 46, 102),
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_rounded),
            label: 'Activity',
          ),
        ],
      ),
    );
  }
}
