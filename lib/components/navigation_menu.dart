import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  // pon esto fuera de build
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          // actualiza el valorde selectedIndex
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.menu_book),    label: 'Reglas'),
            NavigationDestination(icon: Icon(Icons.emoji_events), label: 'Torneos'),
            NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Ejercicios'),
            NavigationDestination(icon: Icon(Icons.settings),      label: 'Configuración'),
          ],
        ),
      ),
      // muestra la pantalla activa
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens =[Container(color: Colors.green,),Container(color: Colors.blue,),Container(color: Colors.red,),Container(color: Colors.black)];
}