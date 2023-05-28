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
}