
import 'package:get_it/get_it.dart';

import '../../app_theme/theme.service.dart';
import '../../screens/base/base-vm.dart';
import '../../screens/home/bottom_nav.vm.dart';
import '../../utils/app_strings.dart';
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
}

registerViewModel(){
  /* TODO Setup viewModels*/
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<BottomNavigationViewModel>(() => BottomNavigationViewModel());
}