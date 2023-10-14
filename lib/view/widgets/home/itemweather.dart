import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/myhomecontroller.dart';
import 'package:weather/data/model/listitems.dart';

class ItemWeather extends StatelessWidget {
  const ItemWeather({
    Key? key,
    required this.listItem,
  }) : super(key: key);
  final ListItem listItem;
  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageControllerImp());
    String? icon = "";
    icon = listItem.weather?[0].icon;
    return GetBuilder<MyHomePageControllerImp>(builder: (controller) {
      if (controller.type
          ? DateFormat.EEEE().format(DateTime.parse(listItem.dtTxt!)) ==
              DateFormat.EEEE().format(DateTime.now())
          : true) {
        return Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Text(
                DateFormat.E().format(DateTime.parse(listItem.dtTxt!)),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat.Hm().format(DateTime.parse(listItem.dtTxt!)),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (icon != "")
                Image.network(
                  controller.getWeatherIconUrl(icon!),
                  scale: 0.7,
                ),
              const SizedBox(height: 4),
              Text(
                " ${(listItem.main!.temp! - 273.15).round()} \u2103",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      } else {
        return const Text('');
      }
    });
  }
}
