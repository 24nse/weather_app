import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "3677bed892474b30b7a122242220806";

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
      );
     if(response.statusCode==200){
       WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
     }
     else{
      throw Exception("opps there was an error, try later");

     }
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ??
          "opps there was an error, try later";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("opps there was an error, try later");
    }
  }
}
 