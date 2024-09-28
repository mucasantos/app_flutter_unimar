import 'dart:convert';

import 'package:unimar_app_pos/models/product_model.dart';
import 'package:http/http.dart' as http;

/// Acessar a API e receber os dados e em seguida, passar para a Screen
///
/// 1.Metodo para pegar os produtos da API

class ProductController {
  String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    //PReciso transformar em json para o app
    List<dynamic> jsonData = json.decode(response.body);

    return jsonData.map((product) => Product.fromJson(product)).toList();
  }
}
