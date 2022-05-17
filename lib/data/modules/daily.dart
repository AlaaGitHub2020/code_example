import 'package:code_example/data/modules/feels_like.dart';
import 'package:code_example/data/modules/temp.dart';
import 'package:code_example/data/modules/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  @JsonKey(name: "dt")
  num? dt;

  @JsonKey(name: "sunrise")
  num? sunrise;

  @JsonKey(name: "sunset")
  num? sunset;

  @JsonKey(name: "moonrise")
  num? moonrise;

  @JsonKey(name: "moonset")
  num? moonSet;

  @JsonKey(name: "moon_phase")
  num? moonPhase;

  @JsonKey(name: "temp")
  Temp? temp;

  @JsonKey(name: "feels_like")
  FeelsLike? feelsLike;

  @JsonKey(name: "pressure")
  num? pressure;

  @JsonKey(name: "humidity")
  num? humidity;

  @JsonKey(name: "dew_point")
  num? dewPoint;

  @JsonKey(name: "wind_speed")
  num? windSpeed;

  @JsonKey(name: "wind_deg")
  num? windDeg;

  @JsonKey(name: "wind_gust")
  num? windGust;

  @JsonKey(name: "weather")
  List<Weather?>? weather;

  @JsonKey(name: "clouds")
  num? clouds;

  @JsonKey(name: "pop")
  num? pop;

  @JsonKey(name: "rain")
  num? rain;

  @JsonKey(name: "uvi")
  num? uvi;

  Daily(
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonSet,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  );

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
