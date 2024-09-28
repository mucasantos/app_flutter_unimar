import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/providers/favorite_provider.dart';
import 'package:unimar_app_pos/views/product_details.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Consumir  a lista de favoritos

    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: favoriteProvider.favoriteProducts.length,
          itemBuilder: (BuildContext context, int index) {
            final product = favoriteProvider.favoriteProducts[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      product: product,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network(product.image),
                title: Text(product.title),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          }),
    );
  }
}
/**
 * 
 * Colunas e Linhas => recebem mais de um widget - children
 */