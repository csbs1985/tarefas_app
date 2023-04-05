import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class SemResultadoWidget extends StatelessWidget {
  const SemResultadoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(UiSvg.vazio),
          const SizedBox(height: 24),
          const Text(
            TAREFA_SEM_RESULTADO,
            style: UiText.headline3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
