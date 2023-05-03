class Weathermodel {
  String date;
  double curr_temp;
  double max_temp;
  double min_temp;
  String weatherState;

  Weathermodel(
      {required this.date,
      required this.curr_temp,
      required this.max_temp,
      required this.min_temp,
      required this.weatherState});
  factory Weathermodel.fromjson(response) {
    var forecast = response["forecast"]["forecastday"][0]["day"];
    return Weathermodel(
        date: response["location"]["localtime"],
        curr_temp: forecast["avgtemp_c"],
        max_temp: forecast['maxtemp_c'],
        min_temp: forecast['mintemp_c'],
        weatherState: forecast["condition"]["text"]);
  }

  // Weathermodel.fromjsondata(data) {
  //   date = data["location"]["localtime"];
  //   curr_temp = data["current"]["temp_c"];
  //   max_temp = data["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
  //   min_temp = data["forecast"]["forecastday"][0]["day"]["mintemp_c"];
  //   weatherState = data['current']["condition"]["text"];
  // }
}
