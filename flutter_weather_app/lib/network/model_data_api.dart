import 'package:json_annotation/json_annotation.dart';

part 'model_data_api.g.dart';

@JsonSerializable()
class CurrentWeather {
  final Location location;
  final Current current;

  const CurrentWeather({
    this.location = const Location(),
    this.current = const Current(),
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}

@JsonSerializable()
class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  @JsonKey(name: 'tz_id')
  final String tzId;
  @JsonKey(name: 'localtime_epoch')
  final int localtimeEpoch;
  final String localtime;

  const Location({
    this.name = "",
    this.region = "",
    this.country = "",
    this.lat = 0.0,
    this.lon = 0.0,
    this.tzId = "",
    this.localtimeEpoch = 0,
    this.localtime = "",
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  @JsonKey(name: 'is_day')
  final int isDay;
  final Condition? condition;
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  @JsonKey(name: 'precip_in')
  final double precipIn;
  final int humidity;
  final int cloud;
  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;
  @JsonKey(name: 'vis_km')
  final double visKm;
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  final double uv;
  @JsonKey(name: 'gust_mph')
  final double gustMph;
  @JsonKey(name: 'gust_kph')
  final double gustKph;

  const Current({
    this.lastUpdatedEpoch = 0,
    this.lastUpdated = "",
    this.tempC = 0.0,
    this.tempF = 0.0,
    this.isDay = 0,
    this.condition,
    this.windMph = 0.0,
    this.windKph = 0.0,
    this.windDegree = 0,
    this.windDir = "",
    this.pressureMb = 0.0,
    this.pressureIn = 0.0,
    this.precipMm = 0.0,
    this.precipIn = 0.0,
    this.humidity = 0,
    this.cloud = 0,
    this.feelslikeC = 0.0,
    this.feelslikeF = 0.0,
    this.visKm = 0.0,
    this.visMiles = 0.0,
    this.uv = 0.0,
    this.gustMph = 0.0,
    this.gustKph = 0.0,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@JsonSerializable()
class Condition {
  final String text;
  final String icon;
  final int code;

  const Condition({
    this.text = "",
    this.icon = "",
    this.code = 0,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  // sans la bib json_serializable
  // Condition.fromJson(Map<String, dynamic> json)
  //     : text = json['text'] as String,
  //       icon = json['icon'] as String,
  //       code = json['code'] as int;
}
