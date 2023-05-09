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
    dynamic jsonObject = await ApiHelper().getRequest("api/users");
    return User.fromJson(jsonObject);
  }
  
  Future<User> updateUser (User user) async{
    try{
      var storage = const FlutterSecureStorage();
      String? token =await storage.read(key: "token");
      if (token == null){
        throw Exception("No token available");
      }
      dynamic jsonObject =await ApiHelper().putRequest(
          'users/${user.id}', user.toJson(),
          headers: {'Authorization': token});
      return User.fromJson(jsonObject);
    }catch(ex){
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