import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

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
          CustomText(text: "searching now", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
