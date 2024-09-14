import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      //A . coluna recebe uma lista de widgets
      body: Column(
        children: [
          Image.asset(AppAssets.store),
          const Text('Faça o login'),
          const Row(
            children: [
              Text("data "),
              Text(" data"),
              Text(" data"),
            ],
          ),
          Image.network(
            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
            height: 300,
          )
        ],
      ),
    );
  }
}
