import 'package:flutter/material.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class SemResultadoWidget extends StatelessWidget {
  const SemResultadoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        TAREFA_SEM_RESULTADO,
        style: UiText.headline3,
      ),
    );
  }
}
