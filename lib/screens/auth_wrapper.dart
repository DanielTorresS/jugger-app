import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'components/navigation_menu.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        // Mostrar loading mientras se verifica el estado de autenticación
        if (authService.isLoading && authService.user == null) {
          return const Scaffold(
            backgroundColor: Color(0xFF000000),
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFFC400),
              ),
            ),
          );
        }

        // Si el usuario está autenticado, mostrar la app principal
        if (authService.isAuthenticated) {
          return const NavigationMenu();
        }

        // Si no está autenticado, mostrar la pantalla de login
        return const LoginScreen();
      },
    );
  }
}

