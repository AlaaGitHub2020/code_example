// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      json['dt'] as num?,
      json['sunrise'] as num?,
      json['sunset'] as num?,
      json['temp'] as num?,
      json['feels_like'] as num?,
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
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
    };
