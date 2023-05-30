class Category {
  int id;
  String name;
  String nameAr;
  String image;
  Category(this.id, this.name , this.nameAr, this.image);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(int.parse(json["id"].toString()), json["name"] , json["name_ar"], json["image"]);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ar": nameAr,
    "image": image,
  };

}