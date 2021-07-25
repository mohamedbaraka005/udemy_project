import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'settings_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': Home(),
      'title': "Home",
    },
    {
      'page':Settingss(),
      'title': "Settings",
    },
    {
      'page': Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            backgroundColor: Colors.orange,
            valueColor:AlwaysStoppedAnimation<Color>(Colors.white) ,
          ),
        ),
      ),
      'title': "Chat"
    }
  ];

  int _SelectedIndex = 0;

  void _x(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_SelectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _SelectedIndex,
        onTap: _x,
        backgroundColor: Color(0xffe3b23c),
        selectedItemColor: Color(0xff570000),
        selectedFontSize: 15,
        unselectedItemColor: Color(0xffb80c09),
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: _pages[0]['title'],
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: _pages[1]['title']),
          BottomNavigationBarItem(
              icon: Icon(Icons.line_style_rounded),
              label: _pages[2]['title']),
        ],
      ),
    );
  }
}
