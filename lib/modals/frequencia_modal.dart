import 'dart:convert';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/frequencia_class.dart';
import 'package:tarefas_app/classes/tipo_frequencia_class.dart';
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
  final TextEditingController _aCadaController = TextEditingController();
  final TextEditingController _inicioController = TextEditingController();
  final TextEditingController _parcelaController = TextEditingController();
  final TextEditingController _periodoController = TextEditingController();

  Map<String, dynamic> freq = {};

  @override
  void initState() {
    super.initState();
    initFrequencia();
  }

  void initFrequencia() {
    if (widget._controller.text != "") {
      Map<String, dynamic> jsonMap =
          _frequenciaClass.separarFrequencia(widget._controller.text);

      setState(() {
        _frequenciaController.text = jsonMap['frequencia'];
        _aCadaController.text = jsonMap['aCada'];
        _inicioController.text = jsonMap['inicio'];
        _parcelaController.text = jsonMap['parcelas'];
        _periodoController.text = jsonMap['periodo'];
      });
    }
  }

  bool onlyACada() {
    return _frequenciaController.text == FrequenciaEnum.aCada.value
        ? true
        : false;
  }

  bool onlyParcelas() {
    return _frequenciaController.text == FrequenciaEnum.parcelas.value
        ? true
        : false;
  }

  bool candFloating() {
    return (_frequenciaController.text == FrequenciaEnum.aCada.value ||
            _frequenciaController.text == FrequenciaEnum.parcelas.value)
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

    if (_frequenciaController.text != FrequenciaEnum.parcelas.value &&
        _frequenciaController.text != FrequenciaEnum.aCada.value) {
      Navigator.of(context).pop();
    }
  }

  void onfloatingActionButton() {
    if (_frequenciaController.text == FrequenciaEnum.aCada.value &&
        (_aCadaController.text.isEmpty || _periodoController.text.isEmpty)) {
      _toastWidget.toast(context, ToastEnum.ERRO.value, PREENCHER);
      return;
    }

    if (_frequenciaController.text == FrequenciaEnum.parcelas.value &&
        (_parcelaController.text.isEmpty || _inicioController.text.isEmpty)) {
      _toastWidget.toast(context, ToastEnum.ERRO.value, PREENCHER);
      return;
    }

    formatFrequencia();
    Navigator.of(context).pop();
  }

  void formatFrequencia() {
    freq.clear();

    freq = {
      'frequencia': _frequenciaController.text,
      'aCada': _aCadaController.text,
      'periodo': _periodoController.text,
      'parcelas': _parcelaController.text,
      'inicio': _inicioController.text,
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
    _aCadaController.dispose();
    _inicioController.dispose();
    _parcelaController.dispose();
    _periodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
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
                      onPressed: () => onPressed(item.text),
                      style: _checkSelected(item.text)
                          ? UiButton.buttonSelected
                          : UiButton.button,
                      child: Text(
                        item.text,
                        style: _checkSelected(item.text)
                            ? UiText.buttonSelected
                            : UiText.button,
                      ),
                    ),
                  const SizedBox(height: 60),
                  if (onlyParcelas())
                    TextoInput(
                      controller: _parcelaController,
                      label: FREQUENCIA_PARCELAS,
                      keyboard: TextInputType.number,
                      callback: (value) => _parcelaController.text = value,
                    ),
                  if (onlyParcelas())
                    TextoInput(
                      controller: _inicioController,
                      label: FREQUENCIA_PARCELAS_INICIAR,
                      keyboard: TextInputType.number,
                      callback: (value) => _inicioController.text = value,
                    ),
                  if (onlyACada())
                    TextoInput(
                      controller: _aCadaController,
                      label: FREQUENCIA_A_CADA_NUMERO,
                      keyboard: TextInputType.number,
                      callback: (value) => _aCadaController.text = value,
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
                          icon: SvgPicture.asset(UiSvg.confirm),
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
