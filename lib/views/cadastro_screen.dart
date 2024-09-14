import 'package:flutter/material.dart';
import 'package:unimar_app_pos/constants/app_styles.dart';
import 'package:unimar_app_pos/constants/assets.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Utilizo os controllers do TExtEditing para ter acesso as info do TExtfield

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? email, password, name;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: AppStyles.bigTitle,
        ),
      ),
      //A . coluna recebe uma lista de widgets

      /**
       Validando os textformfield

      1. Circular os meus textformfield com um Form
      2.Criar um key (chave  para este Form
      3. Criar as validacoes dentro do textfield - utilizo o validators)
       */
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppAssets.loja,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome",
                    hintText: "Informe o seu nome"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Voce precisa digitar o nome';
                  }

                  return null;
                },
                onSaved: (String? newValue) {
                  name = newValue;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "Informe o seu email",
                ),
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
            ElevatedButton(
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

                print(name);
                print(email);
                print(password);
              },
              child: const Text("Cadastrar"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Já tem conta?"),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    print("cliquei no texto azul....");
                  },
                  child: const Text(
                    "Faça login.",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
