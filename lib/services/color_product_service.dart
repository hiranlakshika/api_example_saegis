import 'dart:convert';

import 'package:api_example/model/color_product.dart';
import 'package:http/http.dart' as http;

class ColorProductService {
  Future<ColorProduct?> getColorProducts() async {
    var url = Uri.parse('https://reqres.in/api/products');
    var response = await http.get(url);
    var colorProducts = ColorProduct.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      return colorProducts;
    } else {
      return null;
    }
  }
}
