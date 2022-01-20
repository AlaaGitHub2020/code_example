import 'package:friflex_test/data/modules/clouds.dart';
import 'package:friflex_test/data/modules/coord.dart';
import 'package:friflex_test/data/modules/main_info.dart';
import 'package:friflex_test/data/modules/rain.dart';
import 'package:friflex_test/data/modules/sys.dart';
import 'package:friflex_test/data/modules/weather.dart';
import 'package:friflex_test/data/modules/wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_info.g.dart';

@JsonSerializable()
class WeatherInfo {
  @JsonKey(name: "coord")
  Coord? coord;

  @JsonKey(name: "weather")
  List<Weather?> weather;

  @JsonKey(name: "base")
  String? base;

  @JsonKey(name: "main")
  MainInfo? mainInfo;

  @JsonKey(name: "visibility")
  num? visibility;

  @JsonKey(name: "wind")
  Wind? wind;

  @JsonKey(name: "rain")
  Rain? rain;

  @JsonKey(name: "clouds")
  Clouds? clouds;

  @JsonKey(name: "dt")
  num? dt;

  @JsonKey(name: "sys")
  Sys? sys;

  @JsonKey(name: "timezone")
  num? timezone;

  @JsonKey(name: "id")
  num? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "cod")
  num? cod;

  WeatherInfo(
    this.coord,
    this.weather,
    this.base,
    this.mainInfo,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  );

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}
