import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Bloc/cubit.dart';
import 'package:weather/Bloc/states.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/screens/home_page.dart';
import 'package:weather/services/weather.dart';

void main() {
  runApp(BlocProvider<WeatherCubit>(
      child: const MyApp(),
      create: (context) => WeatherCubit(weatherservice: Weather())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (BuildContext context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: BlocProvider.of<WeatherCubit>(context).model ==
                      null
                  ? Colors.red
                  : BlocProvider.of<WeatherCubit>(context).model!.gettheme()),
          home: HomePage(),
        );
      },
    );
  }
}
