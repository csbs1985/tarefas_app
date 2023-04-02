import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({
    super.key,
    required Function callback,
  }) : _callback = callback;

  final Function _callback;

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      style: UiButton.buttonSelected,
      iconSize: 56,
      icon: SvgPicture.asset(UiSvg.confirmar),
      onPressed: () => widget._callback(),
    );
  }
}
