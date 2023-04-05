import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class EntrarPage extends StatefulWidget {
  const EntrarPage({super.key});

  @override
  State<EntrarPage> createState() => _EntrarPageState();
}

class _EntrarPageState extends State<EntrarPage> {
  final AuthService _authService = AuthService();
  final UsuarioClass _usuarioClass = UsuarioClass();

  signInWithGoogle(BuildContext context) async {
    await _authService
        .signInWithGoogle(context)
        .then((user) => setState(() => _usuarioClass.setUsuario(user!)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: SvgPicture.asset(UiSvg.logo)),
            const Center(
              child: Text(
                ENTRAR_BEM_VINDO,
                style: UiText.headline8,
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: Text(
                ENTRAR_GOOGLE,
                style: UiText.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            IconButton(
              onPressed: () => signInWithGoogle(context),
              icon: SvgPicture.asset(UiSvg.google),
            )
          ],
        ),
      ),
    );
  }
}
