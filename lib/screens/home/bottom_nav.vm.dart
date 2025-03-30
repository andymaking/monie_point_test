import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../widget/animation_spalsh.dart';
import '../base/base-vm.dart';

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
    Scaffold(
      backgroundColor: Colors.red,
    ),Scaffold(
      backgroundColor: Colors.grey,
    ),Scaffold(
      body: Center(
        child: ZoomInAnimation(),
      ),
    ),Scaffold(
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