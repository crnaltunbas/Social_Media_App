import 'package:json_annotation/json_annotation.dart';
part 'photos_model.g.dart';
/// albumId : 1
/// id : 1
/// title : "accusamus beatae ad facilis cum similique qui sunt"
/// url : "https://via.placeholder.com/600/92c952"
/// thumbnailUrl : "https://via.placeholder.com/150/92c952"

@JsonSerializable()
class PhotosModel {
      int? albumId;
      int? id;
      String? title;
      String? url;
      String? thumbnailUrl;

      PhotosModel({
         this.albumId,
         this.id,
         this.title,
         this.url,
         this.thumbnailUrl,
});
      factory PhotosModel.fromJson(Map<String, dynamic> json) => _$PhotosModelFromJson(json);
      Map<String, dynamic> toJson() => _$PhotosModelToJson(this);
}