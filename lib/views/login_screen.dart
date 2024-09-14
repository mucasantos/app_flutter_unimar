import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/app_styles.dart';
import 'package:unimar_app_pos/constants/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Utilizo os controllers do TExtEditing para ter acesso as info do TExtfield
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

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
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppAssets.store,
            ),

            //Input de  dados- TextField

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Informe o seu email"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                obscureText: true,
                controller: senhaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Senha",
                  hintText: "Digite a sua senha",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(" Dados do textfield");

                print(emailController.text);
                print(senhaController.text);
              },
              child: const Text("Login"),
            )
            //  Image.network(
            //      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
            //      height: 300)
          ],
        ),
      ),
    );
  }
}
