//Vou gerenciar o estado de uma lista de favoritos no app

import 'package:flutter/material.dart';
import 'package:unimar_app_pos/models/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
//Crio a lista ou qq variavel que eu  queira observar o estado
//Quando o estado for modificado, eu NOTIFICO a arvore de widgets!

//Quais os estados??
//1. Se é favorito  => bool
//2.Lista de favoritos

  final List<Product> _favoriteProducts = [];
  //Pegar a lista de favoritos
  List<Product> get favoriteProducts => _favoriteProducts;
  //Add um produto aos favoritos

  void addFavoriteProduct(Product product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);

      notifyListeners();
    }
  }

  void removeFavoriteProduct(Product product) {
    _favoriteProducts.remove(product);
    //Importante para a arvore de wigets saber da alteracao!!
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }
}
