import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather/core/class/status_request.dart';
import 'package:weather/core/function/get_des_of_position.dart';
import 'package:weather/core/function/handling_data.dart';
import 'package:weather/core/services/services.dart';
import 'package:weather/data/datasource/remote/weather.dart';
import 'package:weather/data/model/forecastapi.dart';
import 'package:weather/data/model/weatherapi.dart';
import 'package:weather/view/screens/home.dart';

abstract class MyHomePageController extends GetxController {
  addCity();
  updataWeather();
  getDataCurrentWeather(String city);
  getDataCurrentForecast(String city);
  intialData();
  getWeatherIconUrl(String iconCode);
  changeMyLocation();
  changeCity();
}

class MyHomePageControllerImp extends MyHomePageController {
  late TextEditingController textEditingController;
  late TextEditingController changeLocationsController;

  WeatherData weatherData = WeatherData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  WeatherApi? data;
  ForecastApi? dataForecast;
  String temp = "";
  String tempMax = "";
  String tempMin = "";
  String name = "";
  String description = "";
  String icon = "";
  bool type = false;
  String? city = 'cairo';
  String pressure = "";
  String wind = "";
  String humidity = "";
  MyService myService = Get.find();
  @override
  addCity() {
    List<String> currentCitiesNames =
        myService.pref.getStringList("currentCitiesNames") ?? [];
    currentCitiesNames.add(textEditingController.text.toLowerCase());
    myService.pref.setStringList("currentCitiesNames", currentCitiesNames);
    print(currentCitiesNames);
    textEditingController.text = '';
    Get.back();
  }

  @override
  updataWeather() {
    textEditingController = TextEditingController();
    changeLocationsController = TextEditingController();
    name = data!.name!.toUpperCase();
    temp = (data!.mainWeather!.temp! - 273.15).toStringAsFixed(1);
    tempMax = '${(data!.mainWeather!.tempMax! - 273.15).ceil()} °C';
    tempMin = '${(data!.mainWeather!.tempMin! - 273.15).floor()} °C';
    description = data!.weather![0].description!.toUpperCase();
    icon = data!.weather![0].icon!;
    pressure = '${data!.mainWeather!.pressure} hPa';
    wind = '${(data!.wind!.speed! * 3.6).toStringAsFixed(2)} Km/h';
    humidity = "${data!.mainWeather!.humidity}%";
  }

  @override
  getDataCurrentWeather(String city) async {
    var response = await weatherData.getDataweather(city);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = WeatherApi.fromJson(response);
      await updataWeather();
    }
    update();
    return statusRequest;
  }

  @override
  getDataCurrentForecast(String city) async {
    var response = await weatherData.getDataforecast(city);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      dataForecast = ForecastApi.fromJson(response);
      await updataWeather();
    }
    update();
    return statusRequest;
  }

  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    update();
    LocationMap locationMap = LocationMap();
    await locationMap.check(null);
    Placemark position = await locationMap.getDesOfCurrentPosition();
    print("position:-  $position");
    city =
        position.administrativeArea != null && position.administrativeArea != ''
            ? position.administrativeArea
            : 'cairo';
    var currentLocation = myService.pref.getString("currentLocation");
    if (currentLocation != null && currentLocation != '') {
      city = currentLocation;
    }
    await getDataCurrentWeather(city!);
    await getDataCurrentForecast(city!);
    update();
  }

  @override
  String getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/w/$iconCode.png';
  }

  @override
  changeMyLocation() {
    Get.defaultDialog(
      onCancel: () {
        changeLocationsController.text = '';
        Get.back();
      },
      onConfirm: () {
        changeCity();
      },
      title: 'Select your City',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          cursorColor: Colors.white,
          controller: changeLocationsController,
          decoration: const InputDecoration(
            hintText: "Select your default city",
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Color.fromARGB(223, 192, 191, 238),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
          ),
        ),
      ),
    );
  }

  @override
  void changeCity() async {
    String newLocation = changeLocationsController.text.toLowerCase();
    var statusRequestData =
        await getDataCurrentWeather(newLocation) == StatusRequest.success;
    if (statusRequestData) {
      myService.pref.setString("currentLocation", newLocation);
      update();
    }
    Get.offAll(const MyHomePage());
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
