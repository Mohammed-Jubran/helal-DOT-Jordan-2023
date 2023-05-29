import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:helal/controller/api_helper.dart';
import 'package:helal/model/user_model.dart';

class UserController {

  Future<bool> createUser(User user) async {
    try {
      // ignore: unused_local_variable
      dynamic jsonObject =
      await ApiHelper().postRequest('api/users', user.toJson());

      return true;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      rethrow;
    }
  }

  Future<Login> login(String email, String password) async {
    try {
      var result = await ApiHelper().postRequest("/api/users/login", {
        "email": email,
        "password": password,
      });
      return Login.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser() async {
    try {
      var result = await ApiHelper().getRequest("/api/users");
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> update(
      {required String fullName,
      required String email,
      required String phone}) async {
    try {
      var result = await ApiHelper().putRequest("/api/users", {
        "full_name": fullName,
        "email": email,
        "phone": phone,
      },);
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
  
}

class Login {
  String type;
  String token;
  Login(this.type, this.token);

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(json['type'], json['token']);
  }
}