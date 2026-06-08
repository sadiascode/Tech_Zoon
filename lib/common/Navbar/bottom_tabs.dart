import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/featurs/about/about_screen.dart';
import 'package:my_app/featurs/products/products_screen.dart';
import '../../featurs/Chat/chat_screen.dart';
import '../../featurs/home/screen/home_screen.dart';
import '../../featurs/profile/profile_screen.dart';
import 'bottom_tab_item.dart';

final List<BottomTabItem> bottomTabs = [
  BottomTabItem(
    label: "Home",
    icon: Icon(Icons.home),
    page: HomeScreen(),
    isCenter: true,
  ),
  BottomTabItem(
    label: "Products",
    icon: Icon(Icons.fitness_center),
    page: ProductsScreen(),
  ),
  BottomTabItem(
    label: "About Us",
    icon: Icon(Icons.local_dining),
    page: AboutScreen(),
  ),
  BottomTabItem(
    label: "Chat",
    icon: Icon(Icons.chat),
    page: ChatScreen(),
  ),
  BottomTabItem(
    label: "Profile",
    icon: Icon(Icons.person),
    page: ProfileScreen(),
  ),
];