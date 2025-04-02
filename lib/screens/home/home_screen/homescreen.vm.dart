import 'package:flutter/material.dart';
import 'package:monie_point_test/data/models/temp_property_model.dart';
import 'package:monie_point_test/utils/app_strings.dart';

import '../../base/base-vm.dart';

class HomeScreenViewModel extends BaseViewModel {

  late AnimationController controller;
  late AnimationController delayController2;
  late AnimationController delayController3;
  late AnimationController delayController1;
  late Animation<double> fadeAnimation;

  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  
  List<TempProperty> properties = [
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
    TempProperty(url: ImageUrl.homeImage2, location: "Trefoleva St., 43"),
    TempProperty(url: ImageUrl.homeImage3, location: "Gubina St., 11"),
    TempProperty(url: ImageUrl.homeImage4, location: "Sedova St., 22"),
    TempProperty(url: ImageUrl.homeImage5, location: "Macley St., 09"),
    TempProperty(url: ImageUrl.homeImage6, location: "Gladkova St., 25"),
  ];

  void initAnimation(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    );

    controller = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1000),
    );

    delayController2 = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1200),
    );

    delayController3 = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1400),
    );

    delayController1 = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1600),
    );


    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: delayController2, curve: Curves.easeOut),
    );

    animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: delayController1, curve: Curves.easeOut),
    );

    animation4 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: delayController3, curve: Curves.easeOut),
    );


    startAnimations();
  }

  startAnimations() async {
    controller.forward();
    await Future.delayed(Duration(milliseconds: 200));
    delayController2.forward();
    await Future.delayed(Duration(milliseconds: 200));
    delayController1.forward();
    await Future.delayed(Duration(milliseconds: 200));
    delayController3.forward();
  }

  void disposeVm() {
    controller.dispose();
    delayController2.dispose();
    delayController3.dispose();
    delayController1.dispose();
  }

}