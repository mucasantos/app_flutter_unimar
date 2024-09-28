import 'package:flutter/material.dart';
import 'package:unimar_app_pos/models/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Detalhes do produto"),
      ),
      body: Column(
        children: [
          Image.network(
            height: 300,
            widget.product.image,
          ),
          Container(
            color: const Color.fromARGB(255, 45, 45, 45),
            child: Text(
              widget.product.title,
            ),
          ),
          Text(widget.product.category),
          Text(widget.product.description),
          Text(widget.product.price.toString()),
        ],
      ),
    );
  }
}
