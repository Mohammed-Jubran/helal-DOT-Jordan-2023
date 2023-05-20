class Category {
  int id;
  String name;
  String image;
  Category(this.id, this.name, this.image);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(int.parse(json["id"].toString()), json["name"], json["image"]);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };

}