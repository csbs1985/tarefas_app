import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/button/limpar_button.dart';
import 'package:tarefas_app/class/dias_class.dart';
import 'package:tarefas_app/class/forma-pagamento_class.dart';
import 'package:tarefas_app/class/frequencia_class.dart';
import 'package:tarefas_app/class/tipo-movimentacao_class.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';
import 'package:tarefas_app/class/tipo_select_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/modal/select_modal.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({
    super.key,
    required Function callback,
    required TipoSelectEnum tipo,
    required TextEditingController controller,
    bool? border = true,
  })  : _callback = callback,
        _tipo = tipo,
        _controller = controller,
        _border = border;

  final Function _callback;
  final TipoSelectEnum _tipo;
  final TextEditingController _controller;
  final bool? _border;

  @override
  State<SelectInput> createState() => _SelectInput2State();
}

class _SelectInput2State extends State<SelectInput> {
  String _label = '';
  String _labelSelect = '';
  late List _body;

  @override
  void initState() {
    super.initState();
    _getSelect();
  }

  void _getSelect() {
    switch (widget._tipo) {
      case TipoSelectEnum.tipoTarefa:
        _label = TIPO_TAREFA;
        _labelSelect = TIPO_TAREFA_SELECIONE;
        _body = ListaTipoTarefa;
        break;
      case TipoSelectEnum.frequencia:
        _label = FREQUENCIA;
        _labelSelect = FREQUENCIA_SELECIONE;
        _body = ListaFrequencia;
        break;
      case TipoSelectEnum.dia:
        _label = DIA;
        _labelSelect = DIA_SELECIONE;
        _body = ListaDia;
        break;
      case TipoSelectEnum.tipoMovimentacao:
        _label = TIPO_MOVIMENTACAO;
        _labelSelect = TIPO_MOVIMENTACAO_SELECIONE;
        _body = ListaTipoMovimentacao;
        break;
      case TipoSelectEnum.formaMovimentacao:
        _label = FORMA_MOVIMENTACAO;
        _labelSelect = FORMA_MOVIMENTACAO_SELECIONE;
        _body = ListaFormaPagamento;
        break;
    }
  }

  _openModal(TipoSelectEnum select) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => SelectModal(
        label: _labelSelect,
        controller: widget._controller,
        body: _body,
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: widget._border! ? UiBorder.borda : null,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () => _openModal(TipoSelectEnum.tipoTarefa),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        _label,
                        style: UiText.headline2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                      child: Text(
                        widget._controller.text.isNotEmpty
                            ? widget._controller.text
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
