import 'package:flutter/material.dart';
import 'package:unimar_app_pos/mock/products.dart';
import 'package:unimar_app_pos/views/product_details.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState

//Chamada de API=>metodo...
    print("Inicio tela.");
    super.initState();
  }

  bool isBlue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Produtos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: fakeProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        title: fakeProducts[index].titleCat,
                        image: fakeProducts[index].imageCat,
                        color: fakeProducts[index].color,
                      ),
                    ),
                  );
                },
                child: fakeProducts[index]);
          }),
    );
  }
}
/**
 * No item que esta buildado,quando clicar me levar até uma nova tela, 
 * do item em questao...
 * 
 * GestureDetector => adicionar o clicak em qualquer widget
 * 
 */
