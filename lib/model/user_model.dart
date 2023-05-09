class User {
  int? id;
  String? fullName;
  String email;
  String password;
  String? address;
  String? phone;

  User({
    this.id,
     this.fullName,
    required this.email,
    required this.password,
     this.address,
     this.phone,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "password": password,
    "address": address,
    "phone": phone,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        phone: json["phone"]);
  }
}
