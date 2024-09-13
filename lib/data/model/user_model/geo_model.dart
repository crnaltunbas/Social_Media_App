import 'package:json_annotation/json_annotation.dart';
part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel {
  String? lat;
  String? lng;

  GeoModel({
    this.lat,
    this.lng,});

  factory GeoModel.fromJson(dynamic json) => _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);

}