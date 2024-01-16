// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_weather_app/network/model_data_api.dart';
import 'package:http/http.dart' as http;

// ajout de la permission android
// si j'avais aussi deploye pour macos, entitlements a changer aussi

const _BASE_URL = "api.weatherapi.com";

class MeteoApi {
  static final service = MeteoApiService();

  // on rend le constructeur "privé"
  MeteoApi._();
}

// cf https://dart.dev/language/class-modifiers#interface
// et https://dart.dev/language/class-modifiers#interface
// => en dart, une classe est implicitement une interface qu'on peut implémenter sans avoir à
// hériter de ses attributs

// tuto suivi: https://docs.flutter.dev/cookbook/networking/fetch-data
interface class MeteoApiService {
  Future<CurrentWeather> getCurrentMeteo({
    String key = "2f123af51ccb4ffe9b6233431241201",
    String q = "",
  }) async {
    final response = await http.get(Uri.https(
      _BASE_URL,
      "/v1/current.json",
      {"key": key, "q": q},
    ));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return CurrentWeather.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Failed to load current weather");
    }
  }
}
