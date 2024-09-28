import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: const Column(
        children: [
          Text("Tela de favoritos"),
          Text("Olá mundo..."),
        ],
      ),
    );
  }
}
/**
 * 
 * Colunas e Linhas => recebem mais de um widget - children
 */