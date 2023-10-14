import 'package:weather/data/model/clouds.dart';
import 'package:weather/data/model/mainweather.dart';
import 'package:weather/data/model/sys.dart';
import 'package:weather/data/model/weather.dart';
import 'package:weather/data/model/wind.dart';

class ListItem {
  int? dt;
  MainWeather? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop; // Changed to double
  Sys? sys;
  String? dtTxt;

  ListItem({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop, // Changed to double
    this.sys,
    this.dtTxt,
  });

  ListItem.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? MainWeather.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop']?.toDouble(); // Changed to double and added toDouble()
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop; // Changed to double
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }
}
