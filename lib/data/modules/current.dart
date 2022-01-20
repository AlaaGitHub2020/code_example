import 'package:friflex_test/data/modules/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  @JsonKey(name: "dt")
  num? dt;

  @JsonKey(name: "sunrise")
  num? sunrise;

  @JsonKey(name: "sunset")
  num? sunset;

  @JsonKey(name: "temp")
  num? temp;

  @JsonKey(name: "feels_like")
  num? feelsLike;

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
  List<Weather?> weather;

  Current(
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  );

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
