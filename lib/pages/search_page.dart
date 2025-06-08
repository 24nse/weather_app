import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/custom_text.dart';

class SearchPage extends StatefulWidget {
  final VoidCallback? updateUi;
  
  const SearchPage({super.key, this.updateUi});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;
  bool isLoading = false;

  Future<void> _fetchWeatherData(BuildContext context) async {
    if (cityName == null || cityName!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a city name')),
      );
      return;
    }

    setState(() => isLoading = true);
    
    try {
      final weather = await WeatherService().getWeather(cityName: cityName!);
      
      if (weather != null) {
        Provider.of<WeatherProvider>(context, listen: false)
          ..weatherData = weather
          ..cityName = cityName;
        
        widget.updateUi?.call();
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not find weather for $cityName')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching weather: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) => cityName = data,
            onSubmitted: (data) async {
              cityName = data;
              await _fetchWeatherData(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 24,
              ),
              label: const CustomText(text: "Search"),
              suffixIcon: isLoading
                  ? const CircularProgressIndicator()
                  : IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async => await _fetchWeatherData(context),
                    ),
              border: const OutlineInputBorder(),
              hintText: "Enter City",
            ),
          ),
        ),
      ),
    );
  }
}


