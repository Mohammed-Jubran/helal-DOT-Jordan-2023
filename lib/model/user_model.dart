class User {
  int? id;
  String fullName;
  String email;
  String? password;
  String? phone;

  User({
    this.id,
    required this.fullName,
    required this.email,
     this.password,
     this.phone,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "password": password,
    "phone": phone,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"]);
  }
}
