import 'package:flutter/material.dart';

// class NavigationIconView {
//   final String _title;
//   final Widget _icon;
//   final Widget _activeIcon;
//   final BottomNavigationBarItem item;

//   NavigationIconView({Key key, String title, Widget icon, Widget activeIcon}) :
//     _activeIcon = activeIcon,
//     _icon = icon,
//     _title = title,
//     item = new BottomNavigationBarItem(
//       icon: icon,
//       activeIcon: activeIcon,
//       title: Text(title),
//       backgroundColor: Colors.white,
//     )
// }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}