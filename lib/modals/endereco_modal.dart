import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/input/text_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class EnderecoModal extends StatefulWidget {
  const EnderecoModal({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<EnderecoModal> createState() => _AddressModalState();
}

class _AddressModalState extends State<EnderecoModal> {
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();

  late Map<String, dynamic>? _address;

  void getCep(String cep) async {
    if (cep.length == 10) {
      var cepLimpo2 = cep.replaceAll(".", "").replaceAll("-", "");
      final resultCep = await ViaCepService.fetchCep(cep: cepLimpo2);

      _cepController.text = resultCep.cep;
      _logradouroController.text = resultCep.logradouro;
      _complementoController.text = resultCep.complemento!;
      _bairroController.text = resultCep.bairro;
      _cidadeController.text = resultCep.localidade;
      _estadoController.text = resultCep.uf;

      widget._callback(_address.toString());
    }
  }

  void _setText() {
    _address = {
      'cep': _cepController.text,
      'logradouro': _logradouroController.text,
      'numero': _numeroController.text,
      'complemento': _complementoController.text,
      'bairro': _bairroController.text,
      'cidade': _cidadeController.text,
      'estado': _estadoController.text,
    };

    final jsonString = jsonEncode(_address);
    widget._callback(jsonString);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _cepController.dispose();
    _logradouroController.dispose();
    _numeroController.dispose();
    _complementoController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Text(
                ENDERECO_DIGITE,
                style: UiText.headline2,
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  TextInput(
                    controller: _cepController,
                    label: CEP,
                    keyboard: TextInputType.number,
                    cep: true,
                    callback: (value) => getCep(value),
                  ),
                  TextInput(
                    controller: _logradouroController,
                    label: LAGRADOURO,
                    callback: (value) => _logradouroController.text = value,
                  ),
                  TextInput(
                    controller: _numeroController,
                    label: NUMERO,
                    keyboard: TextInputType.number,
                    callback: (value) => _numeroController.text = value,
                  ),
                  TextInput(
                    controller: _complementoController,
                    label: COMPLEMENTO,
                    callback: (value) => _complementoController.text = value,
                  ),
                  TextInput(
                    controller: _bairroController,
                    label: BAIRRO,
                    callback: (value) => _bairroController.text = value,
                  ),
                  TextInput(
                    controller: _cidadeController,
                    label: CIDADE,
                    callback: (value) => _cidadeController.text = value,
                  ),
                  TextInput(
                    controller: _estadoController,
                    label: ESTADO,
                    callback: (value) => _estadoController.text = value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        elevation: 0,
        onPressed: () => _setText(),
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
