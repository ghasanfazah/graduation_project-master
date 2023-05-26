import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marketing_graduation/view/screens/favorite_screen.dart';
import 'package:marketing_graduation/view/screens/home_screen.dart';
import 'package:marketing_graduation/view/screens/profile_screen.dart';
import 'package:marketing_graduation/view/screens/setting_screen.dart';

abstract class BnScreenController extends GetxController{

  changePage(int currentpage);
}

class BnControllerImp extends BnScreenController{

  int currentIndex = 0;

  List<Widget> listPage=[
    const HomeScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
    const ProfileScreen(),
  ];

  @override
  changePage(int i) {
    currentIndex=i;
    update();
  }
}
