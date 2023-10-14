import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/controller/myhomecontroller.dart';

class CustomMainWeather extends StatelessWidget {
  const CustomMainWeather({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    MyHomePageControllerImp controller = Get.put(MyHomePageControllerImp());
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height / 10),
            Text(
              controller.name,
              style: TextStyle(
                fontSize: 34.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.temp} \u2103',
                  style: TextStyle(
                    fontSize: 60.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (controller.icon != '')
                  Image.network(
                    controller.getWeatherIconUrl(controller.icon),
                    scale: 0.5,
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "${controller.description} ",
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'H:${controller.tempMax}   L:${controller.tempMin}',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Pressure = ${controller.pressure}",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Text(
              "Wind = ${(controller.wind)}",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Humidity = ${controller.humidity}",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
