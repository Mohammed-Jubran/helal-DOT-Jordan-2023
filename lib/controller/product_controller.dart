
import 'package:helal/controller/api_helper.dart';
import 'package:helal/model/product_model.dart';

class ProductController {
  Future<List<Product>> getFeaturedProducts() async {
    try {
      List<Product> product = [];
      var response = await ApiHelper().getRequest("/api/products/active");

      response.forEach((v) {
        product.add(Product.fromJson(v));
      });

      return product;
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<Product>> getByCategoryId(int categoryId) async {
    try {
      List<Product> products = [];
      var response = await ApiHelper().getRequest("/api/products/category/$categoryId");

      response.forEach((v) {
        products.add(Product.fromJson(v));
      });

      return products;
    } catch (ex) {
      rethrow;
    }
  }

}