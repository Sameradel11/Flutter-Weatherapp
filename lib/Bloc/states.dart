// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/models/weather_model.dart';

abstract class WeatherStates {}

class WeatherSuccess extends WeatherStates {
  Weathermodel? weathermodel;
  WeatherSuccess({required
    this.weathermodel,
  });
  
}

class WeatherFailure extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class InitialState extends WeatherStates {}
