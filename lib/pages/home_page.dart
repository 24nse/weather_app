import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
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
    final weatherProvider = Provider.of<WeatherProvider>(context);
    weatherData = weatherProvider.weatherDate;

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
      body: weatherData == null
          ? NoWeatherBody()
          : WeatherBody(weatherData: weatherData, weatherProvider: weatherProvider),
    );
  }
}


// Weather Body

class WeatherBody extends StatelessWidget {
  const WeatherBody({
    super.key,
    required this.weatherData,
    required this.weatherProvider,
  });

  final WeatherModel? weatherData;
  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[300]!,
              weatherData!.getThemeColor()[100]!,
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
                text: weatherProvider.cityName ?? 'Unknown City',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: CustomText(
                text:
                    'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                style: const TextStyle(fontSize: 22)),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                CustomText(
                  text: weatherData!.temp.toInt().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    CustomText(
                        text: 'maxTemp:${weatherData!.maxTemp.toInt()}'),
                    CustomText(
                        text: 'minTemp : ${weatherData!.minTemp.toInt()}'),
                  ],
                )
              ],
            ),
            const Spacer(),
            CustomText(
              text: weatherData!.weatherStateName,
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
