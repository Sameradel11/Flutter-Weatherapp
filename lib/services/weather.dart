import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class Weather {
  String baseurl = "https://api.weatherapi.com/v1";

  Future<Weathermodel?> getweathrt({required city_name}) async {
    Weathermodel? weather_object;
    try {
      String cityy_name = city_name;
      String api_key = "d09903072c3f492293513411232104";
      String link = "$baseurl/forecast.json?key=$api_key&q=$cityy_name&days=7";
      http.Response response = await http.get(Uri.parse(link));
      Map<String, dynamic> data = jsonDecode(response.body);
      weather_object = Weathermodel.fromjson(data);
      print(weather_object.weatherState);
    } catch (e) {
      print(e);
    }
    return weather_object;

    // String date = data["location"]["localtime"];
    // double curr_temp = data["current"]["temp_c"];
    // double max_temp = data["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
    // double min_temp = data["forecast"]["forecastday"][0]["day"]["mintemp_c"];
    // String icon = data['current']["condition"]["icon"];
    // String condition = data['current']["condition"]["text"];
    // print(condition);
  }
}
