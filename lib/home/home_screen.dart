import 'package:flutter/material.dart';
import '../constants.dart';

enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}
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
      icon: Icon(icon, color: Color(AppColors.TabIconNormal),),
      activeIcon: Icon(activeIcon, color: Color(AppColors.TabIconActive),),
      title: Text(title, style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColors.TabIconNormal),
      ),),
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
  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
          iconName,
          fontFamily: Constants.IconFontFamily,
        ), size: 22, color: const Color(AppColors.AppBarPopupMenuTextColor),),
        Container(width: 12,),
        Text(title, style: TextStyle(color: const Color(AppColors.AppBarPopupMenuTextColor)),),
      ],
    );
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
          // 显示下拉菜单的一个控件
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe656, '发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe60d, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe63d, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe600, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe63e, '帮助与反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(Icons.add),
            onSelected:  (ActionItems selected) {
              print('点击的是$selected');
            },
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