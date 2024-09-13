import 'package:json_annotation/json_annotation.dart';
part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,});

  factory CompanyModel.fromJson(dynamic json) => _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

}