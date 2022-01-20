import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable()
class Coord {
  @JsonKey(name: "lon")
  num? lon;

  @JsonKey(name: "lat")
  num? lat;

  Coord(
    this.lon,
    this.lat,
  );

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
