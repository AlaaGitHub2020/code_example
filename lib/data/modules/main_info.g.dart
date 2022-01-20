// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainInfo _$MainInfoFromJson(Map<String, dynamic> json) => MainInfo(
      json['temp'] as num?,
      json['feels_like'] as num?,
      json['temp_min'] as num?,
      json['temp_max'] as num?,
      json['pressure'] as num?,
      json['humidity'] as num?,
      json['sea_level'] as num?,
      json['grnd_level'] as num?,
    );

Map<String, dynamic> _$MainInfoToJson(MainInfo instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
    };
