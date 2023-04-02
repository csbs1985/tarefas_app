import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class LimparButton extends StatefulWidget {
  const LimparButton({
    super.key,
    required Function callback,
  }) : _callback = callback;

  final Function _callback;

  @override
  State<LimparButton> createState() => _LimparButtonState();
}

class _LimparButtonState extends State<LimparButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      icon: SvgPicture.asset(
        UiSvg.limpar,
        height: 20,
      ),
      onPressed: () => widget._callback(true),
    );
  }
}
