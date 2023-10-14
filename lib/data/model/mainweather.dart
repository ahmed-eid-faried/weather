class MainWeather {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  MainWeather(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});
  MainWeather.fromJson(Map<String, dynamic> json) {
    temp =
        (json['temp'] is int) ? (json['temp'] as int).toDouble() : json['temp'];
    feelsLike = (json['feels_like'] is int)
        ? (json['feels_like'] as int).toDouble()
        : json['feels_like'];
    tempMin = (json['temp_min'] is int)
        ? (json['temp_min'] as int).toDouble()
        : json['temp_min'];
    tempMax = (json['temp_max'] is int)
        ? (json['temp_max'] as int).toDouble()
        : json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  // MainWeather.fromJson(Map<String, dynamic> json) {
  //   temp = json['temp'];
  //   feelsLike = json['feels_like'];
  //   tempMin = json['temp_min'];
  //   tempMax = json['temp_max'];
  //   pressure = json['pressure'];
  //   humidity = json['humidity'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}
