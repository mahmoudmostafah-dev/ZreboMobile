import 'Image.dart';
import 'itemType.dart';

class ItemModel {
  int id;
  String name;
  String description;
  bool enabled;
  ItemTypeModel itemType;
  List<ImageModel> images;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.enabled,
    required this.itemType,
    required this.images,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        enabled: json["enabled"],
        itemType: ItemTypeModel.fromJson(json["item_type"]),
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "enabled": enabled,
        "item_type": itemType.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}
