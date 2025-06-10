import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherModel {
  final String  cityName;
final  DateTime date;
 final double temp;
  final double maxTemp;
 final  double minTemp;
 final  String weatherCondition;  
  final  String? image;
  WeatherModel( {
  required  this.cityName, 
  required this.weatherCondition, 
  this.image,
  required this.date,
   required this.temp,
  required this.maxTemp,
  required this.minTemp,
  });

  factory WeatherModel.fromJson(dynamic data){
    var jsonData=data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      cityName: data['location']['name'],
      date: DateTime.parse(data["current"]["last_updated"]),
     temp: jsonData["avgtemp_c"],
    maxTemp: jsonData["maxtemp_c"], 
    minTemp: jsonData["mintemp_c"], 
    weatherCondition: jsonData["condition"]["text"]);
  }
    @override
  String toString() {
    return 'tem = $temp  minTemp = $minTemp  date = $date';
  }
  
   String getImage() {
    if (weatherCondition == 'Sunny' || weatherCondition == 'Clear' ||  weatherCondition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (
        
        weatherCondition == 'Blizzard' ||  weatherCondition == 'Patchy snow possible'  ||  weatherCondition == 'Patchy sleet possible' || weatherCondition == 'Patchy freezing drizzle possible' || weatherCondition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherCondition == 'Freezing fog' || weatherCondition == 'Fog' ||  weatherCondition == 'Heavy Cloud' || weatherCondition == 'Mist' || weatherCondition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherCondition == 'Thundery outbreaks possible' || weatherCondition == 'Moderate or heavy snow with thunder' || weatherCondition == 'Patchy light snow with thunder'|| weatherCondition == 'Moderate or heavy rain with thunder' || weatherCondition == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
MaterialColor getThemeColor() {
    if (weatherCondition == 'Sunny' || weatherCondition == 'Clear' ||  weatherCondition == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weatherCondition == 'Blizzard' ||  weatherCondition == 'Patchy snow possible'  ||  weatherCondition == 'Patchy sleet possible' || weatherCondition == 'Patchy freezing drizzle possible' || weatherCondition == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherCondition == 'Freezing fog' || weatherCondition == 'Fog' ||  weatherCondition == 'Heavy Cloud' || weatherCondition == 'Mist' || weatherCondition == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers	') {
      return Colors.blue;
    } else if (weatherCondition == 'Thundery outbreaks possible' || weatherCondition == 'Moderate or heavy snow with thunder' || weatherCondition == 'Patchy light snow with thunder'|| weatherCondition == 'Moderate or heavy rain with thunder' || weatherCondition == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }


}