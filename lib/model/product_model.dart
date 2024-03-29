import 'package:flutter/foundation.dart';

class Product {
  int id;
  String name;
  String nameAr;
  String size;
  double price;
  String image;
  int categoryId;
  int active;
  late Category category;
  int selectedQty = 0;

  Product(
    this.id,
    this.name,
    this.nameAr,
    this.size,
    this.price,
    this.image,
    this.categoryId,
    this.active,
  );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      int.parse(json["id"].toString()),
      json["name"],
      json["name_ar"],
      json["size"],
      double.parse(json["price"].toString()),
      json["image"],
      int.parse(json["category_id"].toString()),
      int.parse(json["active"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_ar": nameAr,
        "quantity": selectedQty,
        "size": size,
        "price": price,
        "image": image,
        "category_id": categoryId,
        "active": active,
      };

  double get total {
    return price * selectedQty;
  }
}
