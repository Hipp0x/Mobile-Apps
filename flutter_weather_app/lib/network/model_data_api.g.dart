// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_data_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      location: json['location'] == null
          ? const Location()
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? const Current()
          : Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String? ?? "",
      region: json['region'] as String? ?? "",
      country: json['country'] as String? ?? "",
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      tzId: json['tz_id'] as String? ?? "",
      localtimeEpoch: json['localtime_epoch'] as int? ?? 0,
      localtime: json['localtime'] as String? ?? "",
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tzId,
      'localtime_epoch': instance.localtimeEpoch,
      'localtime': instance.localtime,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      lastUpdatedEpoch: json['last_updated_epoch'] as int? ?? 0,
      lastUpdated: json['last_updated'] as String? ?? "",
      tempC: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
      tempF: (json['temp_f'] as num?)?.toDouble() ?? 0.0,
      isDay: json['is_day'] as int? ?? 0,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num?)?.toDouble() ?? 0.0,
      windKph: (json['wind_kph'] as num?)?.toDouble() ?? 0.0,
      windDegree: json['wind_degree'] as int? ?? 0,
      windDir: json['wind_dir'] as String? ?? "",
      pressureMb: (json['pressure_mb'] as num?)?.toDouble() ?? 0.0,
      pressureIn: (json['pressure_in'] as num?)?.toDouble() ?? 0.0,
      precipMm: (json['precip_mm'] as num?)?.toDouble() ?? 0.0,
      precipIn: (json['precip_in'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int? ?? 0,
      cloud: json['cloud'] as int? ?? 0,
      feelslikeC: (json['feels_like_c'] as num?)?.toDouble() ?? 0.0,
      feelslikeF: (json['feels_like_f'] as num?)?.toDouble() ?? 0.0,
      visKm: (json['vis_km'] as num?)?.toDouble() ?? 0.0,
      visMiles: (json['vis_miles'] as num?)?.toDouble() ?? 0.0,
      uv: (json['uv'] as num?)?.toDouble() ?? 0.0,
      gustMph: (json['gust_mph'] as num?)?.toDouble() ?? 0.0,
      gustKph: (json['gust_kph'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feels_like_c': instance.feelslikeC,
      'feels_like_f': instance.feelslikeF,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      text: json['text'] as String? ?? "",
      icon: json['icon'] as String? ?? "",
      code: json['code'] as int? ?? 0,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
