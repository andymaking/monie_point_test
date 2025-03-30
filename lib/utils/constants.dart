import 'package:monie_point_test/data/services/storage_service.dart';

import '../data/di/locator.dart';
import '../data/services/navigation_service.dart';
import 'app_strings.dart';

StorageService storageService = StorageService();
NavigationService navigationService = locator<NavigationService>();
ImageUrl imageUrls = ImageUrl();