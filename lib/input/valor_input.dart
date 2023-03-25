import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/valor_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class ValorInput extends StatefulWidget {
  const ValorInput({
    super.key,
    required Function callback,
    required MoneyMaskedTextController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final MoneyMaskedTextController _controller;

  @override
  State<ValorInput> createState() => _ValorInputState();
}

class _ValorInputState extends State<ValorInput> {
  void _clear() {
    currentValor.value = VALOR_INICIAL;
    widget._controller.text = currentValor.value!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: UiColor.border,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    VALOR,
                    style: UiText.headline2,
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: currentValor,
                    builder: (BuildContext context, valor, _) {
                      return TextField(
                        controller: widget._controller,
                        style: currentValor.value == VALOR_INICIAL
                            ? UiText.headline3
                            : UiText.headline1,
                        onChanged: (value) => currentValor.value = value,
                        onSubmitted: (value) =>
                            widget._callback(widget._controller),
                        keyboardType: TextInputType.number,
                      );
                    }),
              ],
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              UiSvg.clean,
              height: 20,
              color: UiColor.icon,
            ),
            onPressed: () => _clear(),
          )
        ],
      ),
    );
  }
}