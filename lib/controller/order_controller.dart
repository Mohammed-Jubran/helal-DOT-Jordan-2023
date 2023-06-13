import 'package:helal/controller/api_helper.dart';
import 'package:helal/model/order_model.dart';

class OrderController {
  Future<dynamic> create(Order order) async {
    try {
      var result = await ApiHelper().postDio("/api/orders", order.toJson());
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }


  Future<List<Order>> getOrdersByUserId(int userId) async {
    try {
      List<Order> order = [];
      var response = await ApiHelper().getRequest("/api/orders/$userId");

      response.forEach((v) {
        order.add(Order.fromJson(v));
      });

      return order;
    } catch (ex) {
      rethrow;
    }
  }

}