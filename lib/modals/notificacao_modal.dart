import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/data_class.dart';
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
  final DataClass _dataClass = DataClass();
  final ToastWidget _toastWidget = ToastWidget();

  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initNotificacao();
  }

  initNotificacao() {
    if (widget._controller.text != "") {
      List<String> partes = widget._controller.text.split(" ");

      setState(() {
        _dataController.text = widget._controller.text;
        _horaController.text = partes[1];
      });
    }
  }

  void _setDate(String value) => _dataController.text = value;

  void _setHour(String value) => _horaController.text = value;

  void _onPressed() {
    if (_dataController.text != "" && _horaController.text != "") {
      String dataHorario =
          _dataClass.unirDataHora(_dataController.text, _horaController.text);

      widget._callback(dataHorario);
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
                    _dataClass.formatDataSomente(widget._controller.text),
                callback: (value) => _setDate(value),
              ),
            ),
            HorarioWidget(
              controller: _horaController,
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
