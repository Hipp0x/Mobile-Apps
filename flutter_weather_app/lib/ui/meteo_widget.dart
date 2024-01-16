import 'package:flutter/material.dart';
import 'package:flutter_weather_app/network/meteo_api_service.dart';
import 'package:flutter_weather_app/network/model_data_api.dart';

class MeteoWidget extends StatefulWidget {
  // ici on peut mettre tous les attributs qui nous
  // seront donnés par le parent (ici MyApp) qui
  // peuvent etre utilisé par l'état du widget.
  // ils ne peuvent jamais êtres modifiés

  const MeteoWidget({super.key});

  // état du widget
  @override
  State<MeteoWidget> createState() => _MeteoWidgetState();
}

class _MeteoWidgetState extends State<MeteoWidget> {
  Future<CurrentWeather>? currentWeather;

  // Cette méthode crée le widget, et
  // est executée à chaque changement d'état avec
  // la méthode setState(), dans laquelle on ne change
  // que le minimum qui doit changer vu que cest le
  // seul truc qui va changer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Weather App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Ville",
                  prefixIcon: Icon(
                    Icons.location_city,
                  ),
                  prefixIconColor: Colors.blue,
                ),
                onSubmitted: (value) async {
                  setState(() {
                    currentWeather = MeteoApi.service.getCurrentMeteo(q: value);
                  });
                },
              ),
            ),
            if (currentWeather != null)
              FutureBuilder<CurrentWeather>(
                  future: currentWeather,
                  builder: (context, snapshot) {
                    final children = <Widget>[];

                    if (snapshot.hasData) {
                      // le get a retourné
                      final data = snapshot.data;

                      debugPrint("parsed data ${data?.location.localtime}");

                      children.addAll([
                        Text("Température pour ${data?.location.name}"),
                        Text("${data?.current.tempC} °C"),
                      ]);
                    } else if (snapshot.hasError) {
                      // erreur lors du get
                      children.add(
                          Text("Une erreur est survenue: ${snapshot.error}"));
                    } else {
                      // loading
                      children.add(const SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ));
                    }

                    // resultat final qui sera construit
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: children,
                      ),
                    );
                  }),
          ],
        ),
      ),
    );
  }
}
