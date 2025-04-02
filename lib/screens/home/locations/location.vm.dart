import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:monie_point_test/screens/base/base-vm.dart';

import '../../../data/di/locator.dart';
import '../../../data/services/location.service.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/snack_message.dart';
import '../../../utils/widget_extensions.dart';

class LocationServiceViewModel extends BaseViewModel{
  bool hasLocationPermission = false;
  LatLng? center;


  final Location _locationService = Location();

  bool asked = false;

  bool serviceEnabled = false;

  Stream<bool> checks() async* {
    serviceEnabled = await _locationService.serviceEnabled();
    notifyListeners();
    yield serviceEnabled;
  }
  
  var popUps = [
    PopUpClass(text: "Cosy areas", value: "cosy", svg: Assets.svg.shieldCheckSvgrepoCom),
    PopUpClass(text: "Price", value: "price", svg: Assets.svg.walletOutlineSvgrepoCom),
    PopUpClass(text: "Infrastructure", value: "Infrastructure", svg: Assets.svg.binSvgrepoCom),
    PopUpClass(text: "Without any layer", value: "layers", svg: Assets.svg.layerSvgrepoCom),
  ];

  double currentLowerValue = 18.0;
  double currentUpperValue = 60.0;

  void onRangeChanged(double lower, double upper) {
    currentLowerValue = lower;
    currentUpperValue = upper;
    notifyListeners();
  }

  GoogleMapController? mopController;
  double radius = 10000.0;

  init() async {
    serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled || !asked) {
      serviceEnabled = await _locationService.requestService();
      asked = true;
      notifyListeners();
    }
    cached();
    // mapInit();
  }

  List<LatLng> locations = [
    LatLng(9.0730, 7.4940),
    LatLng(9.0720, 7.4940),
    LatLng(9.0740, 7.4946),
  ];

  cached(){
    center = LatLng(9.0743, 7.4950);
    // addMarkers();
    notifyListeners();
  }

  mapInit() async {
    startLoader();
    bool hasLocationPermission = await locator<LocationViewModel>().handlePermission();
    if (hasLocationPermission) {
      startLoader();
      Position? position = await locator<LocationViewModel>().getCurrentPosition().then((po){
        cached();
      });


      print("CENTER IS $center");

    }
    notifyListeners();
    stopLoader();
  }

  changeRadius(double value) {
    radius = value;
    notifyListeners();
  }

  onMapControllerChange(GoogleMapController controller) {
    mopController = controller;
    notifyListeners();
  }

}

class PopUpClass {
  String text;
  String value;
  String svg;
  
  PopUpClass({required this.text, required this.value, required this.svg});
}