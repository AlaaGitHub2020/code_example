// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => WeatherInfo(
      json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['base'] as String?,
      json['main'] == null
          ? null
          : MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      json['visibility'] as num?,
      json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      json['rain'] == null
          ? null
          : Rain.fromJson(json['rain'] as Map<String, dynamic>),
      json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      json['dt'] as num?,
      json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      json['timezone'] as num?,
      json['id'] as num?,
      json['name'] as String?,
      json['cod'] as num?,
    );

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.mainInfo,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'rain': instance.rain,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
