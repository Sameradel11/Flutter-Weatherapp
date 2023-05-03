import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weathermodel? _weatherdata;
  set weatherData(Weathermodel? data) {
    weatherData = data;
    notifyListeners();
  }
  Weathermodel? get weatherData{
    return _weatherdata;
  }
}
