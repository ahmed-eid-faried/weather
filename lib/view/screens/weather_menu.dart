import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/controller/menu_weather_controller.dart';
import 'package:weather/view/widgets/weather_menu/custom_app_bar_menu_screen.dart';
import 'package:weather/view/widgets/weather_menu/custom_list_item_menu_screen.dart';
import 'package:weather/view/widgets/weather_menu/custom_search_app_bar_menu_screen.dart';

class WeatherMenu extends StatelessWidget {
  const WeatherMenu({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MenuWeatherController());
    return Scaffold(
        appBar: const CustomAppBarMenuScreen(),
        body: SafeArea(
          child: GetBuilder<MenuWeatherController>(
            builder: (controller) => Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment(0.20, -0.98),
                end: Alignment(-0.2, 0.98),
                colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
              )),
              child: ListView(
                children: [
                  const CustomSearchAppBarMenuScreen(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.currentCities.length,
                    itemBuilder: (context, index) {
                      var item = controller.currentCities[index];
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          child: Dismissible(
                            key: Key("$index"),
                            onDismissed: (direction) =>
                                controller.deleteCity(index),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              decoration: const BoxDecoration(
                                gradient: SweepGradient(
                                  center: Alignment(0, 1),
                                  colors: [
                                    Color(0x00612FAB),
                                    Color(0xFF612FAB),
                                    Color(0x00612FAB),
                                    Color(0xFF612EAB)
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(200),
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                shape: BoxShape.rectangle,
                              ),
                              child: CustomListItemMenuScreen(item: item),
                            ),
                          ));
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
