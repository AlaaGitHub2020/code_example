// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      json['lat'] as num?,
      json['lon'] as num?,
      json['timezone'] as String?,
      json['timezone_offset'] as num?,
      json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      (json['minutely'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Minutely.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['hourly'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Hourly.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['daily'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current,
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
