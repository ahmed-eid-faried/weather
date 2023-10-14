import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/core/binding/bindings.dart';
import 'package:weather/core/constant/apptheme.dart';
import 'package:weather/core/services/services.dart';
import 'package:weather/view/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather/view/screens/weather_menu.dart';

void main() async {
  await initService();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'weather',
          theme: AppThemes.stdTheme,
          initialBinding: MyBindings(),
          initialRoute: "/home",
          getPages: routes,
        );
      },
    );
  }
}

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/home", page: () => const MyHomePage()),
  GetPage(name: "/weathermenu", page: () => const WeatherMenu())
];
