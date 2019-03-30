import 'package:flutter/material.dart';

import './constants.dart' show AppColors;
import './home/home_screen.dart';

// new 可以添加也可以不添加
void main() => runApp(
  MaterialApp(
    title: '微信',
    theme: ThemeData.light().copyWith(
      primaryColor: Color(AppColors.AppBarColor),
      cardColor: Color(AppColors.AppBarColor),
    ),
    home: HomeScreen(),
  )
);

