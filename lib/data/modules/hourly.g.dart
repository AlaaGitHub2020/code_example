// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      json['dt'] as num?,
      json['temp'] as num?,
      json['feels_like'] as num?,
      json['pressure'] as num?,
      json['humidity'] as num?,
      json['dew_point'] as num?,
      json['uvi'] as num?,
      json['clouds'] as num?,
      json['visibility'] as num?,
      json['wind_speed'] as num?,
      json['wind_deg'] as num?,
      json['wind_gust'] as num?,
      (json['weather'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pop'] as num?,
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
      'pop': instance.pop,
    };
