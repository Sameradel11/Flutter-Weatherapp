import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/screens/search_page.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  void upadteui() {
    setState(() {});
  }

// Weathermodel? wdata=Provider.of<WeatherProvider>(context).weatherdata;

  @override
  Widget build(BuildContext context) {
    Weathermodel? Weatherdata =
        Provider.of<WeatherProvider>(context).weatherdata;
    String? cityname = Provider.of<WeatherProvider>(context).city_name;

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
      body: Weatherdata == null
          ? const Center(
              child: Text(
              "There is no weather 😥\nStart searching now",
              style: TextStyle(fontSize: 31),
            ))
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Weatherdata.gettheme(),
                Weatherdata.gettheme()[300]!,
                Weatherdata.gettheme()[100]!
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 4),
                  Text(
                    cityname!.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("last updated at",
                          style: TextStyle(
                            fontSize: 22,
                          )),
                      Text(
                        DateFormat("  hh:mm ").format(
                          DateTime.parse(Weatherdata.date),
                        ),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                  const Spacer(flex: 1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Weatherdata.getImage()),
                        Text(Weatherdata.curr_temp.round().toString(),
                            style: const TextStyle(fontSize: 30)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Max:${Weatherdata.min_temp.round()}",
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(("Min:  ${Weatherdata.max_temp.round()}"),
                                  style: const TextStyle(fontSize: 20))
                            ])
                      ]),
                  const Spacer(flex: 2),
                  Text(
                    Weatherdata.weatherState,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 6),
                ],
              ),
            ),
    );
  }
}
