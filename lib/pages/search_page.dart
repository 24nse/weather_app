import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Search a City"),
      ),
      body: Center(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (value){},
            onSubmitted: (value) {
              
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
              label: CustomText(text: "search"),
              suffixIcon: GestureDetector(
                onTap: () {
                  
                },
                child: Icon(Icons.search),
                
              ),
              border: OutlineInputBorder(),
              hintText: "Enter City"
            ),
          ),
          ),
      ),
    );
  }
}