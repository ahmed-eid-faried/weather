import 'package:weather/core/class/curd.dart';
import 'package:weather/core/constant/applink.dart';

class WeatherData {
  Curd curd;
  WeatherData(this.curd);

  getDataforecast(String city) async {
    String forecastapi = "${AppLink.forecastLink}$city${AppLink.appid}";
    print("forecastapi:- $forecastapi");
    var response = await curd.getData(forecastapi);
    return response.fold((l) => l, (r) => r);
  }

  getDataweather(String city) async {
    String weatherapi = "${AppLink.weatherLink}$city${AppLink.appid}";
    print("weatherapi:- $weatherapi");
    var response = await curd.getData(weatherapi);
    return response.fold((l) => l, (r) => r);
  }

  getWeatherOfYourPosition(double lat, double lon) async {
    String city = 'lat=$lat&lon=$lon';
    String weatherapi =
        "${AppLink.weatherOfYourPositionsLink}$city${AppLink.appid}";
    print("weatherapi:- $weatherapi");
    var response = await curd.getData(weatherapi);
    return response.fold((l) => l, (r) => r);
  }
}
