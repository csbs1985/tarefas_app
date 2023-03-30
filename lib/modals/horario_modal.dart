import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/horario_widget.dart';

class HorarioModal extends StatefulWidget {
  const HorarioModal({
    super.key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<HorarioModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<HorarioModal> {
  String _hour = "";

  @override
  void initState() {
    super.initState();
    initNotificacao();
  }

  initNotificacao() {
    if (widget._controller.text != "")
      setState(() => _hour = widget._controller.text);
  }

  void _setHour(String value) => _hour = value;

  void onFloatingActionButton() {
    widget._controller.text = _hour;
    widget._callback(_hour);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorarioWidget(
              controller: widget._controller,
              callback: (value) => _setHour(value),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => onFloatingActionButton(),
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
