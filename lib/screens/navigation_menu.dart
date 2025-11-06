import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jugger/screens/tournament_results.dart';
import 'package:jugger/screens/tournament_solicitude.dart';
import 'package:jugger/services/auth_service.dart';

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
    const TournamentSolicitude(),
    const Training(),
    const Rules(),
    const TournamentMain(),
    const SettingsScreen(),
  ];

  //Iconos del menu de navegacion
  static const Color iconColor = Colors.black;
  static const double sizeIcon = 30;

  final List<Widget> _navigationItem = [
    const Icon(Icons.emoji_events, color: iconColor, size: sizeIcon),
    const Icon(Icons.scoreboard_outlined, color: iconColor, size: sizeIcon),
    const Icon(Icons.menu_book, color: iconColor, size: sizeIcon),
    const Icon(Icons.fitness_center, color: iconColor, size: sizeIcon),
    const Icon(Icons.settings, color: iconColor, size: sizeIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _screens[_screen], // muestra directamente tu ListView
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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Configuración',
            style: AppTextStyles.headLine1(),
          ),
          const SizedBox(height: 40),
          Consumer<AuthService>(
            builder: (context, authService, child) {
              return Column(
                children: [
                  // Información del usuario
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundComponent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 60,
                          color: AppColors.accent2,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          authService.user?.email ?? 'Usuario',
                          style: AppTextStyles.subtitle1(),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Usuario autenticado',
                          style: AppTextStyles.caption1(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botón de logout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: authService.isLoading
                          ? null
                          : () async {
                              try {
                                await authService.signOut();
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Sesión cerrada exitosamente'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Error al cerrar sesión: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                      icon: authService.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.logout, color: Colors.black),
                      label: Text(
                        authService.isLoading
                            ? 'Cerrando sesión...'
                            : 'Cerrar Sesión',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent2,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Información adicional
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundComponent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Jugger App v1.0.0',
                          style: AppTextStyles.bodyTextBold1(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Aplicación para el deporte de Jugger',
                          style: AppTextStyles.caption1(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

