import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/button/limpar_button.dart';
import 'package:tarefas_app/class/endereco_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/modal/endereco_modal.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class EnderecoInput extends StatefulWidget {
  const EnderecoInput({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<EnderecoInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<EnderecoInput> {
  final EnderecoClass _enderecoClass = EnderecoClass();

  void _openModal() {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => EnderecoModal(
        controller: widget._controller,
        callback: (value) => _setControllerModal(value),
      ),
    );
  }

  void _setControllerModal(String value) {
    setState(() {
      widget._controller.text = value;
      widget._callback(value);
    });
  }

  String addressFormat() {
    var test = _enderecoClass.montarEnderecoString(widget._controller.text);
    return test;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: UiBorder.borda,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () => _openModal(),
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
                      child: Text(ENDERECO, style: UiText.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                      child: Text(
                        widget._controller.text.isNotEmpty
                            ? addressFormat()
                            : SELECIONE,
                        style: widget._controller.text.isNotEmpty
                            ? UiText.headline1
                            : UiText.headline3,
                      ),
                    )
                  ],
                ),
              ),
              LimparButton(callback: (value) => _setControllerModal('')),
            ],
          ),
        ),
      ),
    );
  }
}
