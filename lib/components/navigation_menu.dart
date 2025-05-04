import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jugger/screens/tournament_main.dart';

import '../core/app_colors.dart';
import '../screens/rules.dart';
import '../screens/training.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _screen = 2; //pag. default

  // Lista de paginas existentes para el menu de navegacion
  final List<Widget> _screens = [
    const TournamentMain(),
    const Training(),
    const Rules(),
    Center(child: Text('excersise coming soon',style: TextStyle(color: Colors.white,fontSize: 32),)),
    Center(child: Text('Settings coming soon',style: TextStyle(color: Colors.white,fontSize: 32),)),
  ];

  //Iconos del menu de navegacion
  static const Color iconColor = Colors.black;
  static const double sizeIcon = 30;

  final List<Widget> _navigationItem = [
    const Icon(Icons.emoji_events, color: iconColor, size: sizeIcon),
    const Icon(Icons.scoreboard_outlined, color: iconColor, size: sizeIcon),
    const Icon(Icons.menu_book, color: iconColor,   size: sizeIcon),
    const Icon(Icons.fitness_center, color: iconColor, size: sizeIcon),
    const Icon(Icons.settings, color: iconColor, size: sizeIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background,
      body: SafeArea(
        child: _screens[_screen],   // muestra directamente tu ListView
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _screen,
        height: 75,
        color: const Color(0xFFFFC400),
        buttonBackgroundColor: Color(0xFFC53535),
        backgroundColor: Colors.black,
        items: _navigationItem,
        onTap: (int i) {
          setState(() => _screen = i);
        },
      ),
    );
  }
}