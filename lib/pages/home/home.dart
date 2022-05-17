// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:igreja_app/pages/biblia/biblia-page.dart';
import 'package:igreja_app/pages/configuration/configuration.dart';
import 'package:igreja_app/pages/feedpage/feed.dart';
import 'package:igreja_app/pages/live/live.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    // BibliaPage(),
    LivePage(),
    ConfigurationPage(),
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
        title: const Text('CELE - Jaraguá do Sul'),
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
                backgroundColor: Colors.lightBlue),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.bookmark),
            //     label: ('Bíblia'),
            //     backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv),
                label: ('Ao vivo'),
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ('Configuração'),
              backgroundColor: Colors.lightBlue,
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
