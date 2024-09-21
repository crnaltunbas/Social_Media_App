// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosModel _$PhotosModelFromJson(Map<String, dynamic> json) => PhotosModel(
      albumId: (json['albumId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$PhotosModelToJson(PhotosModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
