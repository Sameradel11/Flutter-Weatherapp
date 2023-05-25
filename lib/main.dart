import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      child: const MyApp(), create: (context) => WeatherProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weatherdata ==
                  null
              ? Colors.red
              : Provider.of<WeatherProvider>(context).weatherdata!.gettheme()),
      home: const Home_page(),
    );
  }
}
