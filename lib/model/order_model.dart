import 'package:helal/model/address.dart';
import 'package:helal/model/product_model.dart';

class Order {
  List<Product>? products;
  Address? address;
  int? paymentMethodId;
  double? total;
  DateTime? orderDate;
  double? subTotal;

  Order({
    this.orderDate,
     this.products,
     this.address,
     this.paymentMethodId,
     this.total,
     this.subTotal,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderDate: DateTime.parse(json["order_date"].toString()),
      paymentMethodId: int.parse(json["payment_method_id"].toString()),
      total: double.parse(json['total'].toString()),
      subTotal: double.parse(json['sub_total'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "sub_total": subTotal,
    "total": total,
    "payment_method_id": paymentMethodId,
    "products": products?.map((e) => e.toJson()).toList(),
    "address": address?.toJson(),
  };
}