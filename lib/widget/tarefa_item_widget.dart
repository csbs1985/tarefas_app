import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_size.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class TarefaItemWidget extends StatefulWidget {
  const TarefaItemWidget({super.key});

  @override
  State<TarefaItemWidget> createState() => _TarefaItemWidgetState();
}

class _TarefaItemWidgetState extends State<TarefaItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: UiSize.tarefaItemHeight,
      decoration: BoxDecoration(
        color: UiColor.element,
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
      child: Row(
        children: [
          SvgPicture.asset(UiSvg.voltar),
        ],
      ),
    );
  }
}
