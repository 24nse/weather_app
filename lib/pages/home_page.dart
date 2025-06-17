import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/custom_text.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';




class HomePage extends StatelessWidget {

 const  HomePage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()  {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) =>const SearchPage(),
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
            return const WeatherInfoBody();
          }
          else{
            return const Center(child:  Text("Something went wrong please try again!"));
          }
        },
      ),
    );
  }
}
