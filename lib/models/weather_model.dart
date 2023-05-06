import 'package:flutter/material.dart';

class Weathermodel {
  String date;
  double curr_temp;
  double max_temp;
  double min_temp;
  String weatherState;
  Weathermodel(
      {required this.date,
      required this.curr_temp,
      required this.max_temp,
      required this.min_temp,
      required this.weatherState});
  factory Weathermodel.fromjson(response) {
    var forecast = response["forecast"]["forecastday"][0]["day"];
    return Weathermodel(
        date: DateTime.now().add(const Duration(hours: 1)).toString(),
        // date: response["location"]["localtime"],
        curr_temp: forecast["avgtemp_c"],
        max_temp: forecast['maxtemp_c'],
        min_temp: forecast['mintemp_c'],
        weatherState: forecast["condition"]["text"]);
  }
  String getImage() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherState == "Seet" ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers ' ||
        weatherState == "Patchy rain possible" ||
        weatherState == "Moderate rain") {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor gettheme() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return Colors.cyan;
    } else if (weatherState == 'Sunny') {
      return Colors.amber;
    } else if (weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers ' ||
        weatherState == "Patchy rain possible" ||
        weatherState == "Moderate rain") {
      return Colors.lightBlue;
    } else {
      return Colors.lightGreen;
    }

    // Weathermodel.fromjsondata(data) {
    //   date = data["location"]["localtime"];
    //   curr_temp = data["current"]["temp_c"];
    //   max_temp = data["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
    //   min_temp = data["forecast"]["forecastday"][0]["day"]["mintemp_c"];
    //   weatherState = data['current']["condition"]["text"];
    // }
  }
}
