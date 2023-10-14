import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/myhomecontroller.dart';
import 'package:weather/core/class/handling_data_view.dart';
import 'package:weather/view/widgets/home/floating_action_button.dart';
import 'package:weather/view/widgets/home/custom_bottom_app_bar.dart';
import 'package:weather/view/widgets/home/custom_forecast.dart';
import 'package:weather/view/widgets/home/custom_main_weather.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageControllerImp());
    return Scaffold(
      body: GetBuilder<MyHomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const CustomFloatingActionButton(),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.20, -0.98),
                  end: Alignment(-0.2, 0.98),
                  colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/1.jpeg'),
                  opacity: 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              child: const Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomMainWeather(),
                  CustomForecast(),
                  CustomBottomAppBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
