import 'package:json_annotation/json_annotation.dart';
import 'geo_model.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;

  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,});

  factory AddressModel.fromJson(dynamic json) => _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

}