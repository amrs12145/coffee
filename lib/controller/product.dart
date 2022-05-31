import 'package:coffe/model/product.dart';
import 'package:coffe/net/net.dart';

class ProductController {
  static Future<List<Product>> getProduct() async {
    final response = await Net.dio.get('products');

    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
