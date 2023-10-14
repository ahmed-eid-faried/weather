class Wind {
  double? speed;
  double? deg; // Change the data type to double

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = (json['speed'] as num?)?.toDouble(); // Convert to double
    deg = (json['deg'] as num?)?.toDouble(); // Convert to double
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    return data;
  }
}
