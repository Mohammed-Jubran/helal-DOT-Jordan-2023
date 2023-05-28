import 'package:flutter/material.dart';
import 'package:helal/model/address.dart';
import 'package:helal/model/product_model.dart';

class ProductProvider with ChangeNotifier{

  List<Product> selectedProduct=[];
  double total=0;
  double finalTotal=0.0;
  Address? address;
  final keyForm = GlobalKey<FormState>();
  int paymentMethod = 1;


  addToCart(Product product){
    selectedProduct.add(product);
    generateTotal();
    notifyListeners();
  }

  updateAddress(Address newAddress) {
    address = newAddress;
  }

  updatePaymentMethod(int newId) {
    paymentMethod = newId;
    notifyListeners();
  }

  removeProduct(int index){
    selectedProduct.removeAt(index);
    generateTotal();
    notifyListeners();
  }

  updateQty(Product product, int newQty){
    product.selectedQty=newQty;
    generateTotal();
    notifyListeners();
  }

  generateTotal(){
    total=0;
    finalTotal=0;
    for(Product product in selectedProduct){
      total+=product.selectedQty * product.price;
    }
    finalTotal=total+2;
  }


}