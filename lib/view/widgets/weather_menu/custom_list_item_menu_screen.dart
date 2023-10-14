import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/controller/menu_weather_controller.dart';
import 'package:weather/data/model/weatherapi.dart';

class CustomListItemMenuScreen extends StatelessWidget {
  const CustomListItemMenuScreen({
    super.key,
    required this.item,
  });

  final WeatherApi? item;

  @override
  Widget build(BuildContext context) {
    MenuWeatherController controller = Get.put(MenuWeatherController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          children: [
              SizedBox(width: 12.w),
            Text(
              " ${(item!.mainWeather!.temp! - 273.15).round()} \u2103",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Image.network(
                controller.getWeatherIconUrl(item!.weather![0].icon!),
                scale: 0.5.sp,
              ),
            ),
          ],
        ),
        Text(
          "Wind = ${(item!.wind!.speed! * 3.6).toStringAsFixed(2)} Km/h",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'H:${(item!.mainWeather!.tempMax! - 273.15).ceil()} \u2103   L:${(item!.mainWeather!.tempMin! - 273.15).floor()} \u2103',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("Pressure = ${item!.mainWeather!.pressure} hPa",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            )),
        Text("Humidity = ${item!.mainWeather!.humidity}%",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                " ${item!.name!.toUpperCase()}, ${item!.sys!.country!.toUpperCase()} ",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                )),
            Text(" ${item!.weather![0].description}",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ],
    );
  }
}
