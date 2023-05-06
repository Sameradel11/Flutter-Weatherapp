import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/services/weather.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search page"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (city_name) async {
                // String user_city_name = data;
                Weather service = Weather();

                Provider.of<WeatherProvider>(context, listen: false)
                        .weatherdata =
                    await service.getweathrt(city_name: city_name);
                print(Provider.of<WeatherProvider>(context, listen: false)
                    .weatherdata!
                    .date);
                Provider.of<WeatherProvider>(context, listen: false).city_name =
                    city_name;

                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      vertical: 30, horizontal: 8),
                  label: Text("Search"),
                  hintText: "Enter  a city",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ));
  }
}
