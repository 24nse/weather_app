// Weather Body
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/viewmodel/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_text.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
 final WeatherModel weatherModel; 
  @override
  Widget build(BuildContext context) {
    
    return weatherModel == null
        ? const Center(child: CircularProgressIndicator())
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  weatherModel.getThemeColor(),
                  weatherModel.getThemeColor()[300]!,
                  weatherModel.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Expanded(
                  child: CustomText(
                    text: weatherModel.cityName ?? 'Unknown City',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text:
                        'updated at : ${weatherModel.date.hour.toString()}:${weatherModel.date.minute.toString()}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    weatherModel.image != null
                        ? Image.network("https:${weatherModel.image}")
                        : Image.asset(weatherModel.getImage()),
                    CustomText(
                      text: weatherModel.temp.toInt().toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: 'maxTemp:${weatherModel.maxTemp.toInt()}',
                        ),
                        CustomText(
                          text: 'minTemp : ${weatherModel.minTemp.toInt()}',
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                CustomText(
                  text: weatherModel.weatherCondition,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 5),
              ],
            ),
          );
  }
}
