import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weatherprovider.dart';
import 'package:weather/screens/search_page.dart';

class Home_page extends StatefulWidget {
  Home_page({super.key});
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    update: upadteui,
                  );
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text("Weather"),
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? const Center(
              child: Text(
              "There is no weather 😥\nStart searching now",
              style: TextStyle(fontSize: 31),
            ))
          : Container(
              color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 4),
                  Text(
                    "currcity",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text("updated at {weatherdata!.date}",
                      style: const TextStyle(
                        fontSize: 22,
                      )),
                  const Spacer(flex: 1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/clear.png"),
                        Text("{(weatherdata!.curr_temp).round()}",
                            style: const TextStyle(fontSize: 30)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Min: {(weatherdata!.min_temp).round()} ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("Max: {(weatherdata!.max_temp.round())}",
                                  style: TextStyle(fontSize: 20))
                            ])
                      ]),
                  const Spacer(flex: 2),
                  Text(
                    "{weatherdata!.weatherState}",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 6)
                ],
              ),
            ),
    );
  }
}
