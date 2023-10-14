import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/core/class/status_request.dart';
import 'package:weather/core/function/handling_data.dart';
import 'package:weather/core/services/services.dart';
import 'package:weather/data/datasource/remote/weather.dart';
import 'package:weather/data/model/weatherapi.dart';
import 'package:weather/view/screens/home.dart';

class MenuWeatherController extends GetxController {
  String citySearch = 'london';
  List<WeatherApi?> currentCities = [];
  List<String>? currentCitiesNames = [];
  MyService myService = Get.find();
  late StatusRequest statusRequest;
  late TextEditingController textEditingController;
  WeatherData weatherData = WeatherData(Get.find());

  searchWeather(String citySearch) async {
    currentCities.clear();
    Set<String>? currentCitiesNamesSetk = {};
    currentCitiesNamesSetk.add(citySearch);
    for (String cityk in currentCitiesNamesSetk) {
      WeatherApi? weatherData = await getDataCurrentWeather(cityk);
      if (weatherData != null) {
        currentCities.add(weatherData);
      }
    }
    update();
  }

  search() async {
    citySearch = textEditingController.text;
    await searchWeather(citySearch);
    update();
  }

  getAllCities() async {
    textEditingController = TextEditingController();
    currentCitiesNames = myService.pref.getStringList("currentCitiesNames") ??
        ['NewYork', 'Ottawa', 'london', 'paris'];
    if (currentCitiesNames!.isEmpty && currentCitiesNames != null) {
      currentCitiesNames = ['NewYork', 'Ottawa', 'london', 'paris'];
    }
    currentCities.clear();
    Set<String>? currentCitiesNamesSet = currentCitiesNames!.toSet();
    for (String city in currentCitiesNamesSet) {
      WeatherApi? weatherData = await getDataCurrentWeather(city);
      if (weatherData != null) {
        currentCities.add(weatherData);
      }
    }
    myService.pref
        .setStringList("currentCitiesNames", currentCitiesNamesSet.toList());
    update();
  }

  getDataCurrentWeather(String city) async {
    WeatherApi? data;
    var response = await weatherData.getDataweather(city);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = WeatherApi.fromJson(response);
    }

    return data;
  }

  String getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/w/$iconCode.png';
  }

  @override
  void onInit() async {
    await getAllCities();
    super.onInit();
  }

  deleteCity(int index) async {
    currentCitiesNames = myService.pref.getStringList("currentCitiesNames") ??
        ['NewYork', 'Ottawa', 'london', 'paris'];
    if (currentCitiesNames!.length > index) {
      currentCitiesNames!.removeAt(index);
      myService.pref.setStringList("currentCitiesNames", currentCitiesNames!);
      Get.offAll(const MyHomePage());
    }
  }

  void changeSearch(String value) async {
    if (value == '') {
      await getAllCities();
    }
  }
}
