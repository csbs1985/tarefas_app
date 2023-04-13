import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/button/limpar_button.dart';
import 'package:tarefas_app/class/data_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/modal/notificacao_modal.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class NotificacaoInput extends StatefulWidget {
  const NotificacaoInput({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<NotificacaoInput> createState() => _NotificacaoInputState();
}

class _NotificacaoInputState extends State<NotificacaoInput> {
  final DataClass _dataClass = DataClass();

  void _openModal() {
    showDialog(
      context: context,
      barrierColor: UiColor.overlay,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: UiColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiBorder.rounded),
        ),
        content: NotificacaoModal(
          controller: widget._controller,
          callback: (value) => _setControllerModal(value),
        ),
      ),
    );
  }

  void _setControllerModal(String value) {
    setState(() {
      widget._controller.text = _dataClass.formatDataNotificacao(value);
      widget._callback(value);
    });
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
                      child: Text(NOTIFICACAO, style: UiText.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                      child: Text(
                        widget._controller.text.isNotEmpty
                            ? _dataClass
                                .formatDataNotificacao(widget._controller.text)
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
