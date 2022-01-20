// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feels_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) => FeelsLike(
      json['day'] as num?,
      json['night'] as num?,
      json['eve'] as num?,
      json['morn'] as num?,
    );

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
