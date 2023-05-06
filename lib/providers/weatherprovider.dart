import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weathermodel? _weatherdata;
  String? city_name;
  set weatherdata(Weathermodel? data) {
    _weatherdata = data;
    notifyListeners();
  }

  Weathermodel? get weatherdata {
    return _weatherdata;
  }
}
