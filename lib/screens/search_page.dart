import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/screens/home_page.dart';
import 'package:weather/services/weather.dart';
import '../models/weather_model.dart';


class SearchPage extends StatelessWidget {
  String? city;
  VoidCallback? update;
  SearchPage({this.update});
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
              onSubmitted: (data) async {
                String user_city_name = data;
                Weather service = Weather();

                Weathermodel weather_object =
                    await service.getweathrt(city_name: user_city_name);
                Provider.of<WeatherProvider>(context,listen : false).weatherData =
                    weather_object;
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

