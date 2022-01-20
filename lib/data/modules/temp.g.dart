// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      json['day'] as num?,
      json['min'] as num?,
      json['max'] as num?,
      json['night'] as num?,
      json['eve'] as num?,
      json['morn'] as num?,
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
