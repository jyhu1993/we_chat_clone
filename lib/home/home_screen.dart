import 'package:flutter/material.dart';
import '../constants.dart' show Constants;

// 没有继承，一个单纯的class
class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    _activeIcon = activeIcon,
    _icon = icon,
    _title = title,
    item = new BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: Text(title),
      backgroundColor: Colors.white,
    );
}

class HomeScreen extends StatefulWidget {
  
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;
  // initState只初始化一次
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe79f,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe62f,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe655,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe6c2,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe629,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe62a,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe6c2,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar =BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击$index 个tab');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: () {print('按钮');},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {print('add');},
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}