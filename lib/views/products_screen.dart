import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/assets.dart';
import 'package:unimar_app_pos/views/widgets/category_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryWidget(
                titleCat: "Frash Fuits & Vegetable",
                imageCat: AppAssets.categ1,
                color: Colors.blue,
              ),
              CategoryWidget(
                titleCat: "Cooking oil & Ghee",
                imageCat: AppAssets.categ2,
                color: Colors.yellow,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryWidget(
                titleCat: "Meat & Fish",
                imageCat: AppAssets.categ3,
                color: Colors.green,
              ),
              CategoryWidget(
                titleCat: "Bakery & Snacks",
                imageCat: AppAssets.categ4,
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryWidget(
                titleCat: "Dairy & Eggs",
                imageCat: AppAssets.categ5,
                color: Colors.red,
              ),
              CategoryWidget(
                titleCat: "Beverages",
                imageCat: AppAssets.categ6,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
