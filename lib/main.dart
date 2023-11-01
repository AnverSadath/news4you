import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:News4you/controller/home_screen_controller.dart';
import 'package:rename/rename.dart';
import 'package:News4you/view/splashscreen/splashscreen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => home_screen_controller(),
        )
      ],
      child: MaterialApp(home: Splash_Screen()),
    );
  }
}
