class Product{
  int id;
  String name;
  String size;
  double price;
  String image;
  int categoryId;
  int active;

  Product(this.id,this.name,this.size,this.price,this.image,this.categoryId,this.active,);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(int.parse(json["id"].toString()), json["name"], json["size"], double.parse(json["price"].toString()), json["image"], int.parse(json["category_id"].toString()), int.parse(json["active"].toString()));
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "size": size,
    "price": price,
    "image": image,
    "category_id": categoryId,
    "active": active,
  };

}