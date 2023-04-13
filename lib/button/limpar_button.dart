import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class LimparButton extends StatefulWidget {
  const LimparButton({
    super.key,
    required Function callback,
    bool? boolean = true,
  })  : _callback = callback,
        _boolean = boolean;

  final Function _callback;
  final bool? _boolean;

  @override
  State<LimparButton> createState() => _LimparButtonState();
}

class _LimparButtonState extends State<LimparButton> {
  _onPressed() {
    return widget._boolean! ? widget._callback(true) : widget._callback();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      icon: SvgPicture.asset(
        UiSvg.limpar,
        height: 20,
      ),
      onPressed: () => _onPressed(),
    );
  }
}
