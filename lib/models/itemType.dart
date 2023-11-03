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

  int? itemCount;

  ItemTypeModel({
    required this.id,
    required this.name,
    required this.image,
    this.itemCount,
  });

  factory ItemTypeModel.fromJson(Map<String, dynamic> json) => ItemTypeModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "itemCount": itemCount,
      };
}
