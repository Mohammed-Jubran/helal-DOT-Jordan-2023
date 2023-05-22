import 'package:flutter/material.dart';
import 'package:helal/model/product_model.dart';

class ProductProvider with ChangeNotifier{

  List<Product> selectedProduct=[];
  double total=0;

  addToCart(Product product){
    selectedProduct.add(product);
    generateTotal();
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
    for(Product product in selectedProduct){
      total+=product.selectedQty * product.price;
    }
  }

}