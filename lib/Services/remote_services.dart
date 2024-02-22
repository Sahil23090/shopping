import 'package:http/http.dart' as http;

import '../Model/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await http.get(Uri.parse(
        'https://fakestoreapi.com/products/?=30'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}