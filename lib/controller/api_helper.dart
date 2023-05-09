import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper{
  final String domain = "192.168.0.2:3333";

  Future<String> getToken()async {
    var storage = const FlutterSecureStorage();
    String result =await storage.read(key: "token") as String;
    return result;
  }

  Future<dynamic> getRequest (String path)async{
    Uri uriFunction =Uri.http(domain,path);
    http.Response response =await http.get(uriFunction);
    return responseFunction(response);
  }

  Future <dynamic> postRequest (String path, Map body) async{
    Uri uriFunction = Uri.http(domain,path);
    http.Response response =await http.post(uriFunction,body: body);
    return responseFunction(response);
  }

  Future<dynamic> putRequest (String path,Map body,{required Map<String,String>headers})async{
    Uri uriFunction =Uri.http(domain,path);
    http.Response response =await http.put(uriFunction,body: body);
    return responseFunction(response);
  }

  Future<dynamic> deleteRequest(String path, {required Map<String, String> headers}) async {
    Uri uriFunction = Uri.http(domain, path);
    http.Response response = await http.delete(uriFunction, headers: headers);
    return responseFunction(response);
  }

  dynamic responseFunction(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic jsonObject = jsonDecode(response.body);
        return jsonObject;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Unauthorized";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }

}