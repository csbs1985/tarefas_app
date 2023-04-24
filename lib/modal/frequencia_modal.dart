import 'dart:convert';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/class/frequencia_class.dart';
import 'package:tarefas_app/class/periodo_class.dart';
import 'package:tarefas_app/class/recorrencia_class.dart';
import 'package:tarefas_app/class/tipo_frequencia_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/input/texto_input.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/toast_widget.dart';

class FrequenciaModal extends StatefulWidget {
  const FrequenciaModal({
    super.key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<FrequenciaModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<FrequenciaModal> {
  final FrequenciaClass _frequenciaClass = FrequenciaClass();
  final ToastWidget _toastWidget = ToastWidget();

  final TextEditingController _frequenciaController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _parcelaInicialController =
      TextEditingController();
  final TextEditingController _parcelaTotalController = TextEditingController();
  final TextEditingController _periodoController = TextEditingController();
  final TextEditingController _periodoAtualController = TextEditingController();

  Map<String, dynamic> freq = {};

  @override
  void initState() {
    super.initState();
    initFrequencia();
  }

  void initFrequencia() {
    if (widget._controller.text != "") {
      Map<String, dynamic> jsonMap =
          _frequenciaClass.stringToMap(widget._controller.text);

      setState(() {
        _quantidadeController.text = jsonMap['aCada']['quantidade'];
        _periodoController.text = jsonMap['aCada']['periodo'];
        _frequenciaController.text = jsonMap['recorrencia']['tipo'];
        _parcelaInicialController.text = jsonMap['parcela']['parcelaInicial'];
        _parcelaTotalController.text = jsonMap['parcela']['parcelaTotal'];
        _periodoAtualController.text = jsonMap['parcela']['parcelaAtual'];
      });
    }
  }

  bool onlyACada() {
    return _frequenciaController.text == RecorrenciaEnum.aCada.value
        ? true
        : false;
  }

  bool onlyParcelas() {
    return _frequenciaController.text == RecorrenciaEnum.parcelas.value
        ? true
        : false;
  }

  bool candFloating() {
    return (_frequenciaController.text == RecorrenciaEnum.aCada.value ||
            _frequenciaController.text == RecorrenciaEnum.parcelas.value)
        ? true
        : false;
  }

  bool _checkSelected(String text) {
    return _frequenciaController.text == text ? true : false;
  }

  bool _checkSubselected(String text) {
    return _periodoController.text == text ? true : false;
  }

  void onPressed(String frequencia) {
    setState(() => _frequenciaController.text = frequencia);

    formatFrequencia();

    if (_frequenciaController.text != RecorrenciaEnum.parcelas.value &&
        _frequenciaController.text != RecorrenciaEnum.aCada.value) {
      Navigator.of(context).pop();
    }
  }

  void onfloatingActionButton() {
    if (_frequenciaController.text == RecorrenciaEnum.aCada.value &&
        (_quantidadeController.text.isEmpty ||
            _periodoController.text.isEmpty)) {
      _toastWidget.toast(context, ToastEnum.ERRO.value, PREENCHER);
      return;
    }

    if (_frequenciaController.text == RecorrenciaEnum.parcelas.value &&
        (_parcelaTotalController.text.isEmpty ||
            _parcelaInicialController.text.isEmpty)) {
      _toastWidget.toast(context, ToastEnum.ERRO.value, PREENCHER);
      return;
    }

    formatFrequencia();
    Navigator.of(context).pop();
  }

  void formatFrequencia() {
    freq = {};

    freq = {
      'aCada': {
        'periodo': _periodoController.text.isNotEmpty
            ? _periodoController.text
            : PeriodoEnum.meses.value,
        'quantidade': _quantidadeController.text.isNotEmpty
            ? _quantidadeController.text
            : "1",
      },
      'recorrencia': {
        'tipo': _frequenciaController.text,
      },
      'parcela': {
        'parcelaAtual': _periodoAtualController.text != "0"
            ? _parcelaInicialController.text
            : "1",
        'parcelaTotal': _parcelaTotalController.text.isNotEmpty
            ? _parcelaTotalController.text
            : "1",
        'parcelaInicial': _parcelaInicialController.text.isNotEmpty
            ? _parcelaInicialController.text
            : "1",
      },
    };

    String jsonString = jsonEncode(freq);

    setState(() {
      widget._controller.text = jsonString;
      widget._callback(jsonString);
    });
  }

  @override
  void dispose() {
    _frequenciaController.dispose();
    _quantidadeController.dispose();
    _periodoAtualController.dispose();
    _parcelaInicialController.dispose();
    _parcelaTotalController.dispose();
    _periodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.background,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text(FREQUENCIA_SELECIONE, style: UiText.headline2),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var item in ListaFrequencia)
                    TextButton(
                      onPressed: () => onPressed(item.tipo.value),
                      style: _checkSelected(item.tipo.value)
                          ? UiButton.buttonSelected
                          : UiButton.button,
                      child: Text(
                        item.tipo.value,
                        style: _checkSelected(item.tipo.value)
                            ? UiText.buttonSelected
                            : UiText.button,
                      ),
                    ),
                  const SizedBox(height: 60),
                  if (onlyParcelas())
                    TextoInput(
                      controller: _parcelaTotalController,
                      label: FREQUENCIA_PARCELAS,
                      keyboard: TextInputType.number,
                      callback: (value) => _parcelaTotalController.text = value,
                    ),
                  if (onlyParcelas())
                    TextoInput(
                      controller: _parcelaInicialController,
                      label: FREQUENCIA_PARCELAS_INICIAR,
                      keyboard: TextInputType.number,
                      callback: (value) =>
                          _parcelaInicialController.text = value,
                    ),
                  if (onlyACada())
                    TextoInput(
                      controller: _quantidadeController,
                      label: FREQUENCIA_A_CADA_NUMERO,
                      keyboard: TextInputType.number,
                      callback: (value) => _quantidadeController.text = value,
                    ),
                  if (onlyACada())
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                          decoration: UiBorder.borda,
                          child: const Text(
                            FREQUENCIA_A_CADA_TIPO,
                            style: UiText.headline2,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (var item in ListaTipoFrequencia)
                                TextButton(
                                  onPressed: () => setState(() =>
                                      _periodoController.text = item.text),
                                  style: _checkSubselected(item.text)
                                      ? UiButton.buttonSelected
                                      : UiButton.button,
                                  child: Text(
                                    item.text,
                                    style: _checkSubselected(item.text)
                                        ? UiText.buttonSelected
                                        : UiText.button,
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (candFloating())
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => onfloatingActionButton(),
                          style: UiButton.buttonSelected,
                          iconSize: 56,
                          icon: SvgPicture.asset(UiSvg.confirmar),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
