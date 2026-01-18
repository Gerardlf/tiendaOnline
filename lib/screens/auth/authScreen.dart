import 'package:app_navegacion_estado/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseService _firebaseService = FirebaseService();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _loginAnonymously() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = await _firebaseService.signInAnonymously();

      //despues de iniciar sesión, navega a la pantalla principal
      debugPrint("Usuario anónimo iniciado: ${user.uid}");
      context.goNamed("home");
      
    } catch (e) {
      setState(() {
        _errorMessage = "Error al iniciar sesión: $e \n Inténtalo de nuevo.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acceso a tienda online")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Debes iniciar sesión de forma anónima.\n"
                "se creará un usuario temporal para ti.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _loginAnonymously,
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Continuar como invitado"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
