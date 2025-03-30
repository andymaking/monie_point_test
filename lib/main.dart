import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:monie_point_test/data/di/locator.dart';
import 'package:monie_point_test/utils/constants.dart';
import 'package:monie_point_test/utils/constants.dart';
import 'package:provider/provider.dart';

import 'app_theme/app_theme.dart';
import 'app_theme/theme.service.dart';
import 'data/services/navigation_service.dart';
import 'screens/splash/splash.ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, themeProvider, child) {
              return ScreenUtilInit(
                //setup to fit into bigger screens
                designSize: const Size(390, 844),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (BuildContext context, Widget? child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navigationService.navigatorKey,
                    scaffoldMessengerKey: navigationService.snackBarKey,
                    title: "MonieTest",
                    theme: AppTheme.themeData(false),
                    darkTheme: AppTheme.themeData(true),
                    themeMode: themeProvider.themeMode,
                    home: const SplashScreen(),
                  );
                },
              );
            }
        )
    );
  }
}