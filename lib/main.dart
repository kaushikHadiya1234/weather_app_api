import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Screen/Provider/weather_provider.dart';
import 'package:weather_app/Screen/View/home_screen.dart';
import 'package:weather_app/Screen/View/splace_screen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
         create: (context) => WeatherProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => SplaceScreen(),
            'home':(context) => HomeScreen(),
          },
        ),
      ),
    ),
  );
}
