import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleAuth() async {
    if (!_formKey.currentState!.validate()) return;

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      if (_isSignUp) {
        await authService.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cuenta creada exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        await authService.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _handleForgotPassword() async {
    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa tu correo electrónico'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.resetPassword(_emailController.text.trim());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Se ha enviado un enlace de recuperación a tu correo'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo o título
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.accent2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'JUGGER',
                      style: AppTextStyles.headLine1(color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Título de la pantalla
                Text(
                  _isSignUp ? 'Crear Cuenta' : 'Iniciar Sesión',
                  style: AppTextStyles.headLine2(),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Campo de email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon:
                        const Icon(Icons.email, color: AppColors.accent2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.accent2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    if (!value.contains('@')) {
                      return 'Ingresa un correo válido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo de contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon:
                        const Icon(Icons.lock, color: AppColors.accent2),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.accent2,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.accent2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Botón principal
                Consumer<AuthService>(
                  builder: (context, authService, child) {
                    return ElevatedButton(
                      onPressed: authService.isLoading ? null : _handleAuth,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent2,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: authService.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              _isSignUp ? 'Crear Cuenta' : 'Iniciar Sesión',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Botón de cambio de modo
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isSignUp = !_isSignUp;
                    });
                  },
                  child: Text(
                    _isSignUp
                        ? '¿Ya tienes cuenta? Inicia sesión'
                        : '¿No tienes cuenta? Regístrate',
                    style: const TextStyle(color: AppColors.accent2),
                  ),
                ),

                if (!_isSignUp) ...[
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: _handleForgotPassword,
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

