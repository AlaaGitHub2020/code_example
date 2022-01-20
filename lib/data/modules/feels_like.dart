import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@JsonSerializable()
class FeelsLike {
  @JsonKey(name: "day")
  num? day;

  @JsonKey(name: "night")
  num? night;

  @JsonKey(name: "eve")
  num? eve;

  @JsonKey(name: "morn")
  num? morn;

  FeelsLike(
    this.day,
    this.night,
    this.eve,
    this.morn,
  );

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}
