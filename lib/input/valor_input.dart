import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:tarefas_app/buttons/limpar_button.dart';
import 'package:tarefas_app/classes/valor_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_border.dart';
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
      decoration: UiBorder.borda,
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
          LimparButton(callback: (value) => _clear()),
        ],
      ),
    );
  }
}
