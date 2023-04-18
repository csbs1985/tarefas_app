import 'package:flutter/material.dart';
import 'package:tarefas_app/class/svg_class.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required Map<String, dynamic> tarefa,
    required Function callback,
  })  : _tarefa = tarefa,
        _callback = callback;

  final Map<String, dynamic> _tarefa;
  final Function _callback;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final SvgClass _svgClass = SvgClass();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      icon: _svgClass.boolSvgPicture(widget._tarefa),
      color: currentCor.value,
      onPressed: () => widget._callback(),
    );
  }
}
