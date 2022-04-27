// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:igreja_app/pages/feedpage/feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    Text('Feed', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    Text('Bíblia', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    Text('Configuração',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _HomePageState createState() => _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IELB - Jaraguá do Sul'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ('Início'),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: ('Bíblia'),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv),
                label: ('Ao vivo'),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ('Configuração'),
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 1),
    );
  }
}
