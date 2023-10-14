import 'package:weather/data/model/city.dart';
import 'package:weather/data/model/listitems.dart';

class ForecastApi {
  String? cod;
  int? message;
  int? cnt;
  List<ListItem>? list;
  City? city;

  ForecastApi({this.cod, this.message, this.cnt, this.list, this.city});
  ForecastApi.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];

    if (json['message'] is int) {
      message = json['message'];
    } else if (json['message'] is double) {
      message = (json['message'] as double).toInt();
    } else {
      message = null;
    }

    cnt = json['cnt'];

    if (json['list'] != null) {
      list = <ListItem>[];
      json['list'].forEach((v) {
        list!.add(ListItem.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  // ForecastApi.fromJson(Map<String, dynamic> json) {
  //   cod = json['cod'];
  //   message = json['message'];
  //   cnt = json['cnt'];
  //   if (json['list'] != null) {
  //     list = <ListItem>[];
  //     json['list'].forEach((v) {
  //       list!.add(ListItem.fromJson(v));
  //     });
  //   }
  //   city = json['city'] != null ? City.fromJson(json['city']) : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}
