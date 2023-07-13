import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/Bloc/cubit.dart';
import 'package:weather/Bloc/states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                icon: const Icon(Icons.search)),
          ],
          title: const Text("Weather"),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuceessPage(weathermodel: state.weathermodel!);
          } else if (state is WeatherFailure) {
            return Center(
                child: Text(
              "Failed",
              style: TextStyle(fontSize: 50),
            ));
          } else {
            return const Center(
                child: Text(
              "There is no weather 😥\nStart searching now",
              style: TextStyle(fontSize: 31),
            ));
          }
        }));
  }
}

class SuceessPage extends StatelessWidget {
  SuceessPage({
    required this.weathermodel,
    super.key,
  });
  Weathermodel weathermodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weathermodel.gettheme(),
        weathermodel.gettheme()[300]!,
        weathermodel.gettheme()[100]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityname!.toUpperCase(),
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("last updated at",
                  style: TextStyle(
                    fontSize: 22,
                  )),
              Text(
                DateFormat("hh:mm").format(
                  DateTime.parse(weathermodel.date),
                ),
                style: const TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
          const Spacer(flex: 1),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset(weathermodel.getImage()),
            Text(weathermodel.curr_temp.round().toString(),
                style: const TextStyle(fontSize: 30)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Max:${weathermodel.min_temp.round()}",
                style: const TextStyle(fontSize: 20),
              ),
              Text(("Min:  ${weathermodel.max_temp.round()}"),
                  style: const TextStyle(fontSize: 20))
            ])
          ]),
          const Spacer(flex: 2),
          Text(
            weathermodel.weatherState,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
