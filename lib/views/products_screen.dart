import 'package:flutter/material.dart';
import 'package:unimar_app_pos/controller/product_controller.dart';
import 'package:unimar_app_pos/models/product_model.dart';
import 'package:unimar_app_pos/views/product_details.dart';
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
    super.initState();
  }

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
      body: SingleChildScrollView(
        //Utilizar o Future com tipo de dados (tipado!)
        child: FutureBuilder<List<Product>>(
            future: ProductController().getAllProducts(),
            builder: (context, snapshot) {
              //snapshot => é a informacao  que vem do futuro

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("Sem informações"),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Erro ao buscar as informações!!"),
                );
              }
              //A ! (exclamacao) afirma que o valor não  é nulo!!
              List<Product> allProducts = snapshot.data!;

              return Column(
                children: [
                  //  const Text("data"),
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
              );
            }),
      ),
    );
  }
}
