// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      json['dt'] as num?,
      json['sunrise'] as num?,
      json['sunset'] as num?,
      json['moonrise'] as num?,
      json['moonset'] as num?,
      json['moon_phase'] as num?,
      json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
      json['feels_like'] == null
          ? null
          : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      json['pressure'] as num?,
      json['humidity'] as num?,
      json['dew_point'] as num?,
      json['wind_speed'] as num?,
      json['wind_deg'] as num?,
      json['wind_gust'] as num?,
      (json['weather'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['clouds'] as num?,
      json['pop'] as num?,
      json['rain'] as num?,
      json['uvi'] as num?,
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonSet,
      'moon_phase': instance.moonPhase,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
      'uvi': instance.uvi,
    };
