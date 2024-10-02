import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/providers/product_provider.dart';

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
    final productProvider = Provider.of<ProductProvider>(context);

    //productProvider.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 219, 200),
        shadowColor: const Color.fromARGB(255, 188, 219, 200),
        leading: const Text('data'),
        title: const Text('Title'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 188, 219, 200),
                  Color.fromARGB(255, 176, 213, 190)
                ],
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  border: const OutlineInputBorder(),
                  hintText: "Pesquisa"),
            ),
          ),
        ),
        actions: const [
          Text('data'),
        ],
      ),
      body: SingleChildScrollView(
          //Utilizar o Future com tipo de dados (tipado!)
          child: Column(
        children: [
          //  const Text("data"),
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
              itemCount: productProvider.allProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            product: productProvider.allProducts[index],
                          ),
                        ),
                      );
                    },
                    child: CategoryWidget(
                      product: productProvider.allProducts[index],
                    ));
              }),
        ],
      )),
    );
  }
}
