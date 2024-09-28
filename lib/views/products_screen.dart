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

//Chamada de API=>metodo...

    //  getProducts();
    super.initState();
  }

  List<Product> allProducts = [];
  getProducts() async {
    //utilizar o http (pacote Flutter),
    //Acessar a api e consumir os dados
    // mostrar na tela...

    //Temp => Chamar a API e pegar os dados...
//Tratar os dados...
    String baseUrl = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(baseUrl));

    //PReciso transformar em json para o app
    List<dynamic> jsonData = json.decode(response.body);

    print(jsonData[0]['rating']);

    //Eu sei que o jsonData é uma lista (dinaminca) e vou utilizar o MAP para
    // transformar em uma lista de Produtos!
    //Minha lista foi criada no inicio da aplicacao
    setState(() {
      allProducts =
          jsonData.map((product) => Product.fromJson(product)).toList();
    });

    //Objeto (Class) em Flutter/DART para representar a nossa info
    //que vem da  API

    //print(allProducts[0].image);
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
      floatingActionButton: FloatingActionButton(
          child: const Text("Data"),
          onPressed: () async {
            await getProducts();
          }),
      body: SingleChildScrollView(
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
