import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'get_weather_cubit_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitial());
    WeatherModel ? weatherModel;
  getWeather({required String cityName})async{
try{
      weatherModel=await WeatherService(Dio()).getCurrentWeather(cityName: cityName);

  emit(WeatherLoadedState());

}catch(e){
  emit(WeatherFailureState(e.toString()));
}
  }
}
