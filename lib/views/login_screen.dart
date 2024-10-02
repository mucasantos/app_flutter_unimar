import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/app_styles.dart';
import 'package:unimar_app_pos/constants/assets.dart';
import 'package:unimar_app_pos/views/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? email, password;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          key: const ValueKey('loginTitle'),
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
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppAssets.store,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "Informe o seu email"),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Voce precisa digitar o email';
                        }

                        return null;
                      },
                      onSaved: (String? newValue) {
                        email = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Senha",
                        hintText: "Digite a sua senha",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Voce precisa digitar a senha';
                        }

                        if (value.length < 6) {
                          return 'A senha precisa de 6 caracteres';
                        }

                        return null;
                      },
                      onSaved: (String? newValue) {
                        password = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    key: const ValueKey(
                        'loginButton'), // Adicione uma chave aqui

                    onPressed: () {
                      //Validacao das info do form
                      final form = formKey.currentState;
                      if (form == null || !form.validate()) {
                        return;
                      }
                      form.save();

                      //A partir deste ponto, posso enviar  os dados para  o server...
                      //Caso o servidor   devolva OK,
                      //Navego para proxima tela...
                      //OU mostro mensagem de erro....

                      print(email);
                      print(password);

                      //O email e senha  OK => hipotese

                      //push => inseri a nova tela em uma stack (pilha)
                      //pushReplacement=> removeu a tela anterior da pilha
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não tem conta?"),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          print("cliquei no texto azul....");
                        },
                        child: const Text(
                          "Crie a sua conta.",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
