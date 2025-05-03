import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:jugger/screens/tournament_main.dart';
//import 'components/navigation_menu.dart';
import 'core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
        home: NavigationMenu(),*/
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.Background,
        body: TournamentMain(),
      ),
    //)

    );
  }
}
