import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/tarefa_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/toast_widget.dart';

class TarefaItemWidget extends StatefulWidget {
  const TarefaItemWidget({super.key, required Map<String, dynamic> item})
      : _item = item;

  final Map<String, dynamic> _item;

  @override
  State<TarefaItemWidget> createState() => _TarefaItemWidgetState();
}

class _TarefaItemWidgetState extends State<TarefaItemWidget> {
  final TarefaClass _tarefaClass = TarefaClass();
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();
  final ToastWidget _toastWidget = ToastWidget();

  void _onPressed() {
    try {
      widget._item['aberto'] = !widget._item['aberto'];
      _tarefaFirebase.pathTarefa(widget._item);
      _checkAberto();
    } catch (e) {
      _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_ERRO_UP);
    }
  }

  SvgPicture _checkAberto() {
    var aberto = widget._item['aberto'] ? true : false;

    return aberto
        ? SvgPicture.asset(UiSvg.aberto)
        : SvgPicture.asset(UiSvg.fechado);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      decoration: BoxDecoration(
        color: UiColor.element,
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tarefaClass.svgPicture(widget._item['tipoTarefa']),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget._item['tarefa'],
                    style: UiText.headline1,
                  ),
                  Text(
                    _tarefaClass.formatSubtitulo(widget._item),
                    style: UiText.headline3,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            icon: _checkAberto(),
            onPressed: () => _onPressed(),
          )
        ],
      ),
    );
  }
}
