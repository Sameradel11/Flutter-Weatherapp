import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit({required this.weatherservice}) : super(InitialState());
  String? cityname;
  Weather weatherservice;
  Weathermodel? model;
  void getweatherfn({required ciryname}) async {
    emit(WeatherLoading());
    try {
      model =
          await weatherservice.getweathrt(city_name: ciryname);
      if (model != null) {
        emit(WeatherSuccess(weathermodel: model));
      } else {
        emit(WeatherFailure());
      }
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
