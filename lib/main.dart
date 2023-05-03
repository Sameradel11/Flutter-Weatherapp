import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/screens/home_page.dart';
import 'package:weather/screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

Weathermodel? provider;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return WeatherProvider();
        },
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: Home_page()));
  }
}
