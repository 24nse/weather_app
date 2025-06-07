import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          
          IconButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (ctx){
                return HomePage();
              }));
            },
             icon: Icon(Icons.search))
        ],
        title: CustomText(text: "Weather App",),
      ),
      body:false? Center(
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            CustomText(text: "there is no weather start", style: TextStyle(fontSize: 30),),
            CustomText(text: "searching now",style: TextStyle(fontSize: 30),)
          ],
        ),
      ):
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [

          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Spacer(flex: 3,),
           CustomText(
            text: "",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
              ),),
              CustomText(
                text: "update at",
                style: TextStyle(fontSize: 22),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(""),
                    CustomText(text: "",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
                    Column(
                      children: [
                        CustomText(text: "maxTemp"),
                        CustomText(text: "minTemp"),

                      ],
                    )

                  ],
                ),
                Spacer(),
                CustomText(
                  text: "",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                    ),),
                    Spacer(flex: 5,),

          ],
        ),
      ),
    );
  }
}