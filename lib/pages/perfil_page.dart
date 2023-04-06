import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/appbars/voltar_appbar.dart';
import 'package:tarefas_app/classes/tarefa_class.dart';
import 'package:tarefas_app/classes/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/avatar_widget.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final AuthService authService = AuthService();
  final TarefaClass _tarefaClass = TarefaClass();

  static const _marginPequena = SizedBox(height: 16);
  static const _marginGrande = SizedBox(height: 56);

  @override
  void initState() {
    super.initState();
    currentCor.value = Colors.white;
  }

  checkPagina(String pagina) {
    pagina == RouteEnum.TAREFA.value
        ? _tarefaClass.openModal(context)
        : context.go(pagina);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VoltarAppbar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                            onPressed: () => checkPagina(item.value),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero)),
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
              _marginPequena,
            ],
          ),
        ),
      ),
    );
  }
}
