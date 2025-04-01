import 'package:flutter/material.dart';
import 'package:monie_point_test/data/models/temp_property_model.dart';
import 'package:monie_point_test/utils/app_strings.dart';

import '../../base/base-vm.dart';

class HomeScreenViewModel extends BaseViewModel {

  late AnimationController controller;
  late Animation<double> fadeAnimation;

  List<Animation<double>> itemAnimations = [];
  
  List<TempProperty> properties = [
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
    TempProperty(url: ImageUrl.homeImage1, location: "Gladkova St., 25"),
  ];

  void initAnimation(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    );

    final intervalGap = 1.0 / properties.length;
    itemAnimations = List.generate(properties.length, (i) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(i * intervalGap, (i + 1) * intervalGap, curve: Curves.easeOut),
        ),
      );
    });

    controller.forward();
  }

  void disposeVm() {
    controller.dispose();
  }

}