import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:unimar_app_pos/providers/product_provider.dart'; // Certifique-se de que o caminho está correto
import 'package:unimar_app_pos/views/login_screen.dart';
import 'package:unimar_app_pos/views/home_page.dart';

void main() {
  testWidgets('LoginScreen displays login form', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) =>
            ProductProvider(), // Certifique-se de que está criando o provider
        child: const MaterialApp(home: LoginScreen()),
      ),
    );

    // Verificar se o título "Login" é exibido corretamente
    expect(find.byKey(const ValueKey('loginTitle')), findsOneWidget);
    expect(find.byType(TextFormField),
        findsNWidgets(2)); // Campos de email e senha
    expect(find.byKey(const ValueKey('loginButton')),
        findsOneWidget); // Botão de login
  });

  testWidgets('Login button navigates to HomePage',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: const MaterialApp(home: LoginScreen()),
      ),
    );

    // Preencher email e senha válidos
    await tester.enterText(
        find.byType(TextFormField).first, 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');
    await tester.tap(find.byKey(const ValueKey('loginButton')));
    await tester.pumpAndSettle(); // Esperar a navegação

    // Verificar se navegamos para a HomePage
    expect(find.byType(HomePage), findsOneWidget);
  });

  // ... (os outros testes)
}
