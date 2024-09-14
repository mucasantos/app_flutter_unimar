import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle bigTitle = const TextStyle(
    fontSize: 32,
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.w700,
  );

//Atribui o meu decoration para uma var
  static BoxDecoration containerDeco = BoxDecoration(
    color: const Color.fromARGB(151, 83, 177, 117),
    borderRadius: BorderRadius.circular(18),
    border: Border.all(
      width: 2,
      color: const Color.fromARGB(255, 146, 153, 146),
    ),
  );

//Função
  static BoxDecoration containerDecoFlexible(
    double radius,
    Color color,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        width: 2,
        color: const Color.fromARGB(255, 146, 153, 146),
      ),
    );
  }
}
