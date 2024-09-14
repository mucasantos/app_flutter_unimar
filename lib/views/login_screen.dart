import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/app_styles.dart';
import 'package:unimar_app_pos/constants/assets.dart';
import 'package:unimar_app_pos/views/widgets/category_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: AppStyles.bigTitle,
        ),
      ),
      //A . coluna recebe uma lista de widgets

      /**
       * Texto - estilizar
       * Container => Estilizar
       * Alinhamentos dos itens na Row e Column
       * Criar um componente - separar o código
       * utilizando container e outros
       * Gestos =>
       * 
       * Criar validação
       * Funções
       */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppAssets.store,
            height: 100,
          ),
          Text(
            'Faça o login',
            style: AppStyles.bigTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.whatshot,
                color: Colors.deepPurpleAccent,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: AppStyles.containerDecoFlexible(
                  6,
                  Colors.deepPurple,
                ),
              ),
              const Icon(
                Icons.favorite,
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            padding: const EdgeInsets.all(16),
            height: 150,
            width: 150,
            decoration: AppStyles.containerDeco,
            child: const Text("Estou no Container"),
          ),
          CategoryWidget(
            titleCat: "Frash Fuits & Vegetable",
            imageCat: AppAssets.categ1,
            color: Colors.blue,
          ),

          ElevatedButton(
            onPressed: () {
              print(" Cliquei...");
            },
            child: const Text("Login"),
          )
          //  Image.network(
          //      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
          //      height: 300)
        ],
      ),
    );
  }
}
