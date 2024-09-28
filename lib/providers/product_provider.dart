import 'package:flutter/material.dart';
import 'package:unimar_app_pos/controller/product_controller.dart';
import 'package:unimar_app_pos/models/product_model.dart';

class ProductProvider with ChangeNotifier {
//Controller de acesso a API
  final ProductController _productController = ProductController();

  //O estado dos produtos
  List<Product> _products = [];

  //Verificar se ocorreu algum erro
  bool _isLoading = true;
  //Ocorreu erro??
  bool _hasError = false;

  //PEgar os produtos
  List<Product> get allProducts => _products;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

//Chamar o metodo no construtor
  ProductProvider() {
    fetchProducts();
  }

  //Fetch dos produtos!
//Metodo que acessa o controller da API notificar a minha arvore de widgets

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      List<Product> products = await _productController.getAllProducts();
      _products = products;
      _isLoading = false;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }
}
