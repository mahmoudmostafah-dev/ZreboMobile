import 'package:vortex_zrebo_mobile/models/category.dart';

import 'item.dart';

class RestaurantItemPaginated {
  int count;
  dynamic next;
  dynamic previous;
  List<RestaurantItemResult> results;

  RestaurantItemPaginated({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory RestaurantItemPaginated.fromJson(Map<String, dynamic> json) =>
      RestaurantItemPaginated(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<RestaurantItemResult>.from(
            json["results"].map((x) => RestaurantItemResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class RestaurantItemResult {
  int id;
  String name;
  String logo;
  List<MenuRest> menuRest;

  RestaurantItemResult({
    required this.id,
    required this.name,
    required this.logo,
    required this.menuRest,
  });

  factory RestaurantItemResult.fromJson(Map<String, dynamic> json) =>
      RestaurantItemResult(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        menuRest: List<MenuRest>.from(
            json["menuRest"].map((x) => MenuRest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "menuRest": List<dynamic>.from(menuRest.map((x) => x.toJson())),
      };
}

class MenuRest {
  int id;
  String price;
  String discount;
  ItemModel item;
  CategoryModel category;

  MenuRest({
    required this.id,
    required this.price,
    required this.discount,
    required this.item,
    required this.category,
  });

  factory MenuRest.fromJson(Map<String, dynamic> json) => MenuRest(
        id: json["id"],
        price: json["price"],
        discount: json["discount"],
        item: ItemModel.fromJson(json["item"]),
        category: CategoryModel.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "discount": discount,
        "item": item.toJson(),
        "category": category.toJson(),
      };
}
