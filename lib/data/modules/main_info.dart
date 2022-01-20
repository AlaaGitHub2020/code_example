import 'package:json_annotation/json_annotation.dart';

part 'main_info.g.dart';

@JsonSerializable()
class MainInfo {
  @JsonKey(name: "temp")
  num? temp;

  @JsonKey(name: "feels_like")
  num? feelsLike;

  @JsonKey(name: "temp_min")
  num? tempMin;

  @JsonKey(name: "temp_max")
  num? tempMax;

  @JsonKey(name: "pressure")
  num? pressure;

  @JsonKey(name: "humidity")
  num? humidity;

  @JsonKey(name: "sea_level")
  num? seaLevel;

  @JsonKey(name: "grnd_level")
  num? grndLevel;

  MainInfo(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  );

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}
