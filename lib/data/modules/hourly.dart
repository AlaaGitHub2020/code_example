import 'package:code_example/data/modules/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly {
  @JsonKey(name: "dt")
  num? dt;

  @JsonKey(name: "temp")
  num? temp;

  @JsonKey(name: "feels_like")
  num? feelsLike;

  @JsonKey(name: "pressure")
  num? pressure;

  @JsonKey(name: "humidity")
  num? humidity;

  @JsonKey(name: "dew_point")
  num? dewPoint;

  @JsonKey(name: "uvi")
  num? uvi;

  @JsonKey(name: "clouds")
  num? clouds;

  @JsonKey(name: "visibility")
  num? visibility;

  @JsonKey(name: "wind_speed")
  num? windSpeed;

  @JsonKey(name: "wind_deg")
  num? windDeg;

  @JsonKey(name: "wind_gust")
  num? windGust;

  @JsonKey(name: "weather")
  List<Weather?>? weather;

  @JsonKey(name: "pop")
  num? pop;

  Hourly(
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  );

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
