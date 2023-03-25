import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/classes/horario_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class HorarioWidget extends StatefulWidget {
  const HorarioWidget({
    Key? key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller,
        super(key: key);

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<HorarioWidget> createState() => _HorarioWidgetState();
}

class _HorarioWidgetState extends State<HorarioWidget> {
  final HorarioClass _horarioClass = HorarioClass();

  final double _height = 160;
  final double _width = 48;
  final double _extent = 32;

  final List<String> _hours = List.generate(24, (index) => '$index');
  final List<String> _minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));

  int _horaSelecionada = 0;
  int _minutoSelecionado = 0;

  void onSelectedItemChangedHora(int hora) {
    setState(() => _horaSelecionada = hora);
    formatHorario();
  }

  void onSelectedItemChangedMinuto(int minuto) {
    setState(() => _minutoSelecionado = minuto);
    formatHorario();
  }

  void formatHorario() {
    String horario = '${_horaSelecionada}h${_minutoSelecionado}m';
    widget._callback(horario);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, int> valorInicial = widget._controller.text == ""
        ? _horarioClass.horarioDateNowDouble()
        : _horarioClass.horarioStringDouble(widget._controller.text);

    FixedExtentScrollController horaController =
        FixedExtentScrollController(initialItem: valorInicial["hora"]!);
    FixedExtentScrollController minutoController =
        FixedExtentScrollController(initialItem: valorInicial["minuto"]!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 16, 0, 16),
          child: Text(
            HORARIO,
            style: UiText.headline2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: _height,
              width: _width,
              child: ListWheelScrollView(
                controller: horaController,
                itemExtent: _extent,
                physics: const FixedExtentScrollPhysics(),
                children: _hours
                    .map((hour) => Text(
                          hour,
                          style: UiText.headline7,
                        ))
                    .toList(),
                onSelectedItemChanged: (value) =>
                    onSelectedItemChangedHora(value),
              ),
            ),
            const Text(
              'h',
              style: UiText.headline7,
            ),
            SizedBox(
              height: _height,
              width: _width,
              child: ListWheelScrollView(
                controller: minutoController,
                itemExtent: _extent,
                physics: const FixedExtentScrollPhysics(),
                children: _minutes
                    .map((minute) => Text(
                          minute,
                          style: UiText.headline7,
                        ))
                    .toList(),
                onSelectedItemChanged: (value) =>
                    onSelectedItemChangedMinuto(value),
              ),
            ),
            const Text(
              'm',
              style: UiText.headline1,
            ),
          ],
        ),
      ],
    );
  }
}
