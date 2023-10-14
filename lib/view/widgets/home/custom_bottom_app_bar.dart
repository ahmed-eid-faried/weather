import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/myhomecontroller.dart';
import 'package:weather/view/screens/weather_menu.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyHomePageControllerImp controller = Get.put(MyHomePageControllerImp());
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              controller.changeMyLocation();
            },
            icon: const Icon(
              Icons.location_on_outlined,
              size: 40,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(const WeatherMenu());
            },
            icon: const Icon(
              Icons.menu,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
