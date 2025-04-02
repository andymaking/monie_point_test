
import 'package:get_it/get_it.dart';
import 'package:monie_point_test/screens/home/locations/location.vm.dart';
import 'package:monie_point_test/screens/home/locations/location.vm.dart';

import '../../app_theme/theme.service.dart';
import '../../screens/base/base-vm.dart';
import '../../screens/home/bottom_nav.vm.dart';
import '../../screens/home/home_screen/homescreen.vm.dart';
import '../../utils/app_strings.dart';
import '../services/location.service.dart';
import '../services/navigation_service.dart';
import '../services/storage_service.dart';

GetIt locator = GetIt.I;

setupLocator() {
  registerViewModel();
  setUpServices();
}

setUpServices(){
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<ThemeModel>(() => ThemeModel());
  locator.registerLazySingleton<ImageUrl>(() => ImageUrl());
  locator.registerLazySingleton<LocationViewModel>(() => LocationViewModel());
}

registerViewModel(){
  /* TODO Setup viewModels*/
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<BottomNavigationViewModel>(() => BottomNavigationViewModel());
  locator.registerFactory<HomeScreenViewModel>(() => HomeScreenViewModel());
  locator.registerFactory<LocationServiceViewModel>(() => LocationServiceViewModel());
}