import 'package:json_annotation/json_annotation.dart';

part 'rain.g.dart';

@JsonSerializable()
class Rain {
  @JsonKey(name: "1h")
  num? h1;

  Rain(
    this.h1,
  );

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}
