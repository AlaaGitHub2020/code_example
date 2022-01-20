import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class Temp {
  @JsonKey(name: "day")
  num? day;

  @JsonKey(name: "min")
  num? min;

  @JsonKey(name: "max")
  num? max;

  @JsonKey(name: "night")
  num? night;

  @JsonKey(name: "eve")
  num? eve;

  @JsonKey(name: "morn")
  num? morn;

  Temp(
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  );

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}
