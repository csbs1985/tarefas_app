import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/class/color_class.dart';
import 'package:tarefas_app/class/tarefa_class.dart';
import 'package:tarefas_app/class/text_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/modal/tarefa_modal.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/toast_widget.dart';

class TodasItem extends StatefulWidget {
  const TodasItem({
    super.key,
    required Map<String, dynamic> tarefa,
  }) : _tarefa = tarefa;

  final Map<String, dynamic> _tarefa;

  @override
  State<TodasItem> createState() => _TarefaItemWidgetState();
}

class _TarefaItemWidgetState extends State<TodasItem> {
  final ColorClass _colorClass = ColorClass();
  final TarefaClass _tarefaClass = TarefaClass();
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();
  final TextClass _textClass = TextClass();
  final ToastWidget _toastWidget = ToastWidget();

  Future<void> _onPressed() async {
    try {
      setState(
          () => widget._tarefa['concluida'] = !widget._tarefa['concluida']);
      await Future.delayed(const Duration(seconds: 2),
          () => _tarefaFirebase.pathTarefaConcluida(widget._tarefa));
    } catch (e) {
      _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_ERRO_UP);
    }
  }

  SvgPicture _boolSvgPicture() {
    return widget._tarefa['concluida'] == true
        ? SvgPicture.asset(UiSvg.fechado)
        : SvgPicture.asset(UiSvg.aberto);
  }

  void _openModal() {
    currentTarefa.value = widget._tarefa;

    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => const TarefaModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openModal(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
        decoration: BoxDecoration(
          color: _colorClass.colorAtrasada(widget._tarefa),
          borderRadius: BorderRadius.circular(UiBorder.rounded),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              icon: _boolSvgPicture(),
              color: currentCor.value,
              onPressed: () => _onPressed(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget._tarefa['concluida'] == false)
                      Text(
                        widget._tarefa['tarefa'],
                        style: UiText.headline1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (widget._tarefa['concluida'] == false)
                      Text(
                        _textClass.stringLegenda(widget._tarefa),
                        style: UiText.headline1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (widget._tarefa['concluida'] == true)
                      Text(
                        widget._tarefa['tarefa'],
                        style: UiText.headline10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (widget._tarefa['concluida'] == true)
                      Text(
                        _textClass.stringLegenda(widget._tarefa),
                        style: UiText.headline10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ),
            _tarefaClass.svgPicture(widget._tarefa['tipoTarefa']),
          ],
        ),
      ),
    );
  }
}