import '../constant/constant.dart';
import 'package:home_page/model/product_model_api.dart';

class ProductService {
  // Fetch all products
  Future<List<Product>?> getProducts() async {
    try {
      final response = await dio.get('$url/products/');
      if (response.statusCode == 200) {
        List<Product> products = [];
        for (var productData in response.data['products']) {
          products.add(Product.fromJson(
              productData)); 
        }
        return products;
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  // Fetch products by category
  Future<List<Product>?> getProductsByCategory(String category) async {
    try {
      final response = await dio.get('$url/products/category/$category');
      if (response.statusCode == 200) {
        List<Product> products = [];
        for (var productData in response.data['products']) {
          products.add(Product.fromJson(
              productData)); 
        }
        return products;
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch products by category: $e');
    }
  }

  // Fetch category list
  Future<List<String>?> getCategoryList() async {
    try {
      final response = await dio.get('$url/products/categories');
      if (response.statusCode == 200) {
        return List<String>.from(
            response.data); 
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch category list: $e');
    }
  }

  // Fetch a single product by ID
  Future<Product?> getSingleProduct(int id) async {
    try {
      final response = await dio.get('$url/products/$id');
      if (response.statusCode == 200) {
        return Product.fromJson(
            response.data); 
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch product details: $e');
    }
  }
}
