import 'package:home_page/model/product_model_api.dart';
import '../constant/constant.dart';

class ProductService {
  Future<Product?> getProducts() async {
    try {
      final response = await dio.get('$url/products/');
      print(response.data);
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<ProductElement?> getDetailsProducts({required int id}) async {
    try {
      final response = await dio.get('$url/products/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return ProductElement.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<Product?> getProductsByCategory(String category) async {
    try {
      final response = await dio.get('$url/products/category/$category');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<String>> getCategoryList() async {
    try {
      final response = await dio.get('$url/products/categories');

      if (response.statusCode == 200) {
        print("Fetched categories: ${response.data}"); 

        List<String> categoryNames = [];
        for (var category in response.data) {
          if (category['name'] != null) {
            categoryNames.add(category['name']);
          }
        }

        return categoryNames;
      } else {
        print(
            "Error: Failed to fetch categories. Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return []; 
    }
  }
}
