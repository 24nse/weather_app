import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_app/widgets/custom_text.dart';

class SearchPage extends StatefulWidget {
  final VoidCallback? updateUi;
  
  const SearchPage({super.key, this.updateUi});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 
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
            onSubmitted: (value) async {
            
                    var getWeatherCubit  = BlocProvider.of<GetWeatherCubit>(context);
           getWeatherCubit.getWeather(cityName: value);
              Navigator.maybePop(context);
              
            
       
            
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 24,
              ),
              label: const CustomText(text: "Search"),
             
              border: const OutlineInputBorder(),
              hintText: "Enter City",
            ),
          ),
        ),
      ),
    );
  }
}


