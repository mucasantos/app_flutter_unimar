import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unimar_app_pos/models/product_model.dart';
import 'package:unimar_app_pos/views/product_details.dart';
import 'package:http/http.dart' as http;
import 'package:unimar_app_pos/views/widgets/category_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState

    getProducts();
    super.initState();
  }

  List<Product> allProducts = [];
  getProducts() async {
    String baseUrl = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(baseUrl));

    //PReciso transformar em json para o app
    List<dynamic> jsonData = json.decode(response.body);

    setState(() {
      allProducts =
          jsonData.map((product) => Product.fromJson(product)).toList();
    });
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
      body: allProducts.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const Text("data"),
                  GridView.builder(

                      //As tres propriedades abaixo sao utilizadas para inserir o
                      //gridview builder ddentro de uma coluna com singleScroll..
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: allProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    product: allProducts[index],
                                  ),
                                ),
                              );
                            },
                            child: CategoryWidget(
                              product: allProducts[index],
                            ));
                      }),
                ],
              ),
            ),
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
