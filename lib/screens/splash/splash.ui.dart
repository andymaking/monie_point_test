import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widget/animation_spalsh.dart';
import '../home/bottom_nav.ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  init()async {
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 4))
      ..forward()
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // HANDLE NAVIGATION AFTER SPLASH SCREEN
          appRelaunch();
        }
      });
  }

  @override
  void initState() {
    init();

    super.initState();

  }

  bool isLogIn = false;
  bool? onBoardingCompleted = false;

  Future<Object> appRelaunch() async {

    return navigationService.navigateToAndRemoveUntilWidget(const BottomNavigationScreen(initialIndex: 2,));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZoomInAnimation()
          ],
        ),
      ),
    );
  }
}