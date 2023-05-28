import 'package:helal/model/address.dart';
import 'package:helal/model/product_model.dart';

class Order {
  List<Product> products;
  Address address;
  int paymentMethodId;
  double total;
  double subTotal;

  Order({
    required this.products,
    required this.address,
    required this.paymentMethodId,
    required this.total,
    required this.subTotal,
  });

  Map<String, dynamic> toJson() => {
    "sub_total": subTotal,
    "total": total,
    "payment_method_id": paymentMethodId,
    "products": products.map((e) => e.toJson()).toList(),
    "address": address.toJson(),
  };
}