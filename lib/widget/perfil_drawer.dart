import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/avatar_widget.dart';

class PerfilDrawer extends StatefulWidget {
  const PerfilDrawer({super.key});

  @override
  State<PerfilDrawer> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilDrawer> {
  final AuthService authService = AuthService();

  static const _marginPequena = SizedBox(height: 16);
  static const _marginGrande = SizedBox(height: 56);

  @override
  void initState() {
    super.initState();
    currentCor.value = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: UiColor.background,
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarWidget(),
                _marginPequena,
                Text(
                  currentUsuario.value!['nome'],
                  style: UiText.headline1,
                ),
                Text(
                  currentUsuario.value!['email'],
                  style: UiText.headline1,
                ),
                _marginGrande,
                for (var item in ListaMenu)
                  Column(
                    children: [
                      TextButton(
                        onPressed: () => context.go(item.value),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.fromLTRB(0, 8, 16, 8))),
                        child: Text(item.text, style: item.style),
                      ),
                      _marginPequena,
                    ],
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => authService.signOut(),
            child: const Text(
              SAIR,
              style: UiText.headline9,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
