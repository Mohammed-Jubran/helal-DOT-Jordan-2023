import 'package:helal/controller/api_helper.dart';
import 'package:helal/model/category_model.dart';

class CategoryController {
  Future<List<Category>> getAll() async {
    try {
      List<Category> category = [];
      var response = await ApiHelper().getRequest("/api/categories");

      response.forEach((v) {
        category.add(Category.fromJson(v));
      });

      return category;
    } catch (ex) {
      rethrow;
    }
  }
}