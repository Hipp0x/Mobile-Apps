import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/meteo_widget.dart';

// point d'entree de l'application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.5,
              )),
      home: const MeteoWidget(),
    );
  }
}
