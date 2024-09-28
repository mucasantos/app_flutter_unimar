import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/models/product_model.dart';
import 'package:unimar_app_pos/providers/favorite_provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    //Estancia do provider criado => FavoriteProvider
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    bool isFavorite = favoriteProvider.isFavorite(product);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Detalhes do produto"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                height: 300,
                width: double.infinity,
                product.image,
              ),
              Positioned(
                right: 30,
                child: IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      favoriteProvider.removeFavoriteProduct(product);
                    } else {
                      favoriteProvider.addFavoriteProduct(product);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
              )
            ],
          ),
          Container(
            color: const Color.fromARGB(255, 45, 45, 45),
            child: Text(
              product.title,
            ),
          ),
          Text(product.category),
          Text(product.rating.count.toString()),
          Text(product.rating.rate.toString()),
          Text(product.description),
          Text(product.price.toString()),
        ],
      ),
    );
  }
}
