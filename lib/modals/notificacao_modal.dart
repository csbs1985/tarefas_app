import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/calendario_class.dart';
import 'package:tarefas_app/classes/horario_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/calendario_widget.dart';
import 'package:tarefas_app/widget/horario_widget.dart';
import 'package:tarefas_app/widget/toast_widget.dart';

class NotificacaoModal extends StatefulWidget {
  const NotificacaoModal({
    super.key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<NotificacaoModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<NotificacaoModal> {
  final CalendarioClasss _calendarioClasss = CalendarioClasss();
  final HorarioClass _horarioClass = HorarioClass();
  final ToastWidget _toastWidget = ToastWidget();

  String _date = "";
  String _hour = "";

  @override
  void initState() {
    super.initState();
    initNotificacao();
  }

  initNotificacao() {
    if (widget._controller.text != "") {
      List<String> partes = widget._controller.text.split(" às ");

      setState(() {
        _date = partes[0];
        _hour = partes[1];
      });
    }
  }

  void _setDate(String value) => _date = value;

  void _setHour(String value) => _hour = value;

  void _onPressed() {
    if (_date != "" && _hour != "") {
      widget._callback('$_date às $_hour');
      Navigator.of(context).pop();
    } else
      _toastWidget.toast(context, ToastEnum.ERRO.value, NOTIFICACAO_VAZIO);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CalendarioWidget(
                controller:
                    _calendarioClasss.somenteData(widget._controller.text),
                callback: (value) => _setDate(value),
              ),
            ),
            HorarioWidget(
              controller: _horarioClass.somenteHorario(widget._controller.text),
              callback: (value) => _setHour(value),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => _onPressed(),
                  style: UiButton.buttonSelected,
                  iconSize: 56,
                  icon: SvgPicture.asset(UiSvg.confirmar),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
