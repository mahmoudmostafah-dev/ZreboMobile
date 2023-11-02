// To parse this JSON data, do
//
//     final itemType = itemTypeFromJson(jsonString);

class ItemTypePaginated {
  int count;
  String? next;
  String? previous;
  List<ItemTypeModel> results;

  ItemTypePaginated({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ItemTypePaginated.fromJson(Map<String, dynamic> json) =>
      ItemTypePaginated(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ItemTypeModel>.from(
            json["results"].map((x) => ItemTypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ItemTypeModel {
  int id;
  String name;
  String image;

  ItemTypeModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ItemTypeModel.fromJson(Map<String, dynamic> json) => ItemTypeModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
