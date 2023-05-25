
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/services/weather.dart';

class SearchPage extends StatelessWidget {
  @override
  String? city_name;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search page"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (data) {
                city_name = data;
              },
              onSubmitted: (city_name) async {
                try {
                  Weather service = Weather();
                  Weathermodel? citydata =
                      await service.getweathrt(city_name: city_name);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherdata = citydata;

                  print(Provider.of<WeatherProvider>(context, listen: false)
                      .weatherdata!
                      .date);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .city_name = city_name;

                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                  Navigator.pop(context);
                }
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsetsDirectional.symmetric(
                      vertical: 30, horizontal: 8),
                  label: const Text("Search"),
                  hintText: "Enter  a city",
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () async {
                      try {
                        Weather service = Weather();
                        Weathermodel? citydata =
                            await service.getweathrt(city_name: city_name);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherdata = citydata;

                        print(
                            Provider.of<WeatherProvider>(context, listen: false)
                                .weatherdata!
                                .date);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .city_name = city_name;

                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                  )),
            ),
          ),
        ));
  }
}
