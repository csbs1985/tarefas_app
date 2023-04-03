import 'package:flutter/material.dart';
import 'package:tarefas_app/core/auth_service.dart';

class EntrarPage extends StatefulWidget {
  const EntrarPage({super.key});

  @override
  State<EntrarPage> createState() => _EntrarPageState();
}

class _EntrarPageState extends State<EntrarPage> {
  final AuthService _authService = AuthService();

  signInWithGoogle(BuildContext context) {
    _authService.signInWithGoogle(context).then((user) => {
          setState(() => currentUsuario.value = user!.email!),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          child: const Text("google"),
          onPressed: () => signInWithGoogle(context),
        ),
      ),
    );
  }
}
