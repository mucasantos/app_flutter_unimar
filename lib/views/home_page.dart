import 'package:flutter/material.dart';
import 'package:unimar_app_pos/views/favorite_screen.dart';
import 'package:unimar_app_pos/views/products_screen.dart';
import 'package:unimar_app_pos/views/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Preciso de  um controller
final PageController pageController = PageController();
//Verificar qual a pagina que estou - começa na 0
int currentPage = 0;

class _HomePageState extends State<HomePage> {
  //Criar metodos para navegar-Deixar dentro do STATE

  void onTap(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          ProductsScreen(),
          FavoriteScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_4_outlined),
              label: 'Profile',
            ),
          ]),
    );
  }
}
