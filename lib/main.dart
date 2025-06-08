
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: const HomePage(),
      builder: (context, child) {
        final weatherData = Provider.of<WeatherProvider>(context).weatherDate;
        
        return Theme(
          data: ThemeData(
            primarySwatch: weatherData?.getThemeColor() ?? Colors.blue,
          ),
          child: child!,
        );
      },
    );
  }
}

