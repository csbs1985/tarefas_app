import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/horario_class.dart';
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
  final HorarioClass _horarioClass = HorarioClass();

  String _hour = "";

  void _setHour(String value) {
    _hour = value;
  }

  void onPressed() {
    setState(() {
      widget._controller.text = _hour;
      widget._callback(_hour);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorarioWidget(
              controller: widget._controller,
              callback: (value) => _setHour(value),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        elevation: 0,
        onPressed: () => onPressed(),
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
