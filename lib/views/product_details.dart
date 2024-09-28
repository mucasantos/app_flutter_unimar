import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  final String title;
  final String image;
  final Color color;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do produto"),
      ),
      body: Column(
        children: [
          Image.asset(widget.image),
          Container(
            color: const Color.fromARGB(255, 45, 45, 45),
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
