import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../gen/assets.gen.dart';
import '../../utils/snack_message.dart';
import '../../widget/animation_spalsh.dart';
import '../base/base-vm.dart';
import 'home_screen/homescreen.ui.dart';
import 'locations/location.ui.dart';

class BottomNavigationViewModel extends BaseViewModel {

  List<NavType> navs = [
    NavType(
      activeIcon: Assets.svg.searchSvgrepoCom,
    ),
    NavType(
      activeIcon: Assets.svg.messageSvgrepoCom,
    ),
    NavType(
      activeIcon: Assets.svg.homeSvgrepoCom,
    ),
    NavType(
      activeIcon: Assets.svg.heartSvgrepoCom,
    ),
    NavType(
      activeIcon: Assets.svg.userSvgrepoCom,
    ),
  ];

  int index = 0;

  changeIndex(int val){
    index = val;
    notifyListeners();
  }

  init(int startIndex){
    index = startIndex;
    notifyListeners();
  }

  List<Widget> screens = [
    LocationScreenView(),
    Scaffold(
      backgroundColor: Colors.grey,
    ),
    HomeScreenView(),
    Scaffold(
      backgroundColor: Colors.blueAccent,
    ),Scaffold(
      backgroundColor: Colors.blueGrey,
    ),
  ];

}


class NavType {
  String activeIcon;

  NavType({required this.activeIcon});
}