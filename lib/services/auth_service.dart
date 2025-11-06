import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  AuthService() {
    _init();
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = result.user;
      notifyListeners();
      return result;
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      throw _handleAuthException(e);
    } catch (e) {
      _setLoading(false);
      throw 'Error inesperado: $e';
    }
  }

  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = result.user;
      notifyListeners();
      return result;
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      throw _handleAuthException(e);
    } catch (e) {
      _setLoading(false);
      throw 'Error inesperado: $e';
    }
  }

  Future<void> signOut() async {
    try {
      _setLoading(true);
      await _auth.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      _setLoading(false);
      throw 'Error al cerrar sesión: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      _setLoading(true);
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      throw _handleAuthException(e);
    } catch (e) {
      _setLoading(false);
      throw 'Error inesperado: $e';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No se encontró una cuenta con este correo electrónico.';
      case 'wrong-password':
        return 'Contraseña incorrecta.';
      case 'email-already-in-use':
        return 'Ya existe una cuenta con este correo electrónico.';
      case 'weak-password':
        return 'La contraseña es muy débil.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';
      case 'user-disabled':
        return 'Esta cuenta ha sido deshabilitada.';
      case 'too-many-requests':
        return 'Demasiados intentos fallidos. Intenta más tarde.';
      case 'operation-not-allowed':
        return 'Esta operación no está permitida.';
      default:
        return 'Error de autenticación: ${e.message}';
    }
  }
}

