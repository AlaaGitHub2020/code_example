import 'package:code_example/data/modules/current.dart';
import 'package:code_example/data/modules/daily.dart';
import 'package:code_example/data/modules/hourly.dart';
import 'package:code_example/data/modules/minutely.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  @JsonKey(name: "lat")
  num? lat;

  @JsonKey(name: "lon")
  num? lon;

  @JsonKey(name: "timezone")
  String? timezone;

  @JsonKey(name: "timezone_offset")
  num? timezoneOffset;

  @JsonKey(name: "current")
  Current? current;

  @JsonKey(name: "minutely")
  List<Minutely?>? minutely;

  @JsonKey(name: "hourly")
  List<Hourly?>? hourly;

  @JsonKey(name: "daily")
  List<Daily?>? daily;

  Forecast(
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  );

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
