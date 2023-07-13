import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:weather/Bloc/cubit.dart';
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
                BlocProvider.of<WeatherCubit>(context).cityname = city_name;
                BlocProvider.of<WeatherCubit>(context)
                    .getweatherfn(ciryname: city_name);
                Navigator.pop(context);
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
                      BlocProvider.of<WeatherCubit>(context).cityname =
                          city_name;
                      BlocProvider.of<WeatherCubit>(context)
                          .getweatherfn(ciryname: city_name);
                      Navigator.pop(context);
                    },
                  )),
            ),
          ),
        ));
  }
}
