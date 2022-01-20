import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable()
class Sys {
  @JsonKey(name: "type")
  num? type;
  @JsonKey(name: "id")
  num? id;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "sunrise")
  num? sunrise;
  @JsonKey(name: "sunset")
  num? sunset;

  Sys(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
