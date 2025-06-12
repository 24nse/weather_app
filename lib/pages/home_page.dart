import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/custom_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => SearchPage(updateUi: updateUi),
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        title: const CustomText(text: "Weather App"),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is WeatherInitial){
          return const NoWeatherBody();
          }
          else if(state is WeatherLoadedState){
            return WeatherInfoBody();
          }
          else{
            return const Text("oops there was  an error");
          }
        },
      ),
    );
  }
}


// Weather Body

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  
  });


  @override
  Widget build(BuildContext context) {
    var weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherModel!.getThemeColor(),
              weatherModel!.getThemeColor()[300]!,
              weatherModel!.getThemeColor()[100]!,
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
                style: const TextStyle(fontSize: 22)),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            weatherModel.image!=null? Image.network( "https:${weatherModel.image}"):   Image.asset(weatherModel.getImage()),
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
                        text: 'maxTemp:${weatherModel.maxTemp.toInt()}'),
                    CustomText(
                        text: 'minTemp : ${weatherModel.minTemp.toInt()}'),
                  ],
                )
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


// NO Weather Body
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CustomText(
              text: "there is no weather start",
              style: TextStyle(fontSize: 30),
            ),
            CustomText(
              text: "searching now",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      );
  }
}
