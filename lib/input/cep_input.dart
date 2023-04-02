import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:tarefas_app/buttons/limpar_button.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class CepInput extends StatefulWidget {
  const CepInput({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<CepInput> createState() => _TextoInputState();
}

class _TextoInputState extends State<CepInput> {
  void getCep(String cep) async {
    if (cep.length == 10) widget._callback(cep);
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
                    CEP,
                    style: UiText.headline2,
                  ),
                ),
                TextField(
                  controller: widget._controller,
                  style: UiText.headline1,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => getCep(value),
                  decoration: const InputDecoration(hintText: CEP),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                    CepInputFormatter(),
                  ],
                ),
              ],
            ),
          ),
          LimparButton(callback: (value) => widget._controller.clear()),
        ],
      ),
    );
  }
}
