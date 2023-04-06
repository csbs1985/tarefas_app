import 'package:flutter/material.dart';
import 'package:tarefas_app/classes/data_class.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class ItemPlanejamentoText extends StatefulWidget {
  const ItemPlanejamentoText({
    super.key,
    required Map<String, dynamic> tarefa,
  }) : _tarefa = tarefa;

  final Map<String, dynamic> _tarefa;

  @override
  State<ItemPlanejamentoText> createState() => _ItemPlanejamentoTextState();
}

class _ItemPlanejamentoTextState extends State<ItemPlanejamentoText> {
  final DataClass dataClass = DataClass();

  String _data = "";
  String _legenda = "";
  String _text = "";

  @override
  void initState() {
    super.initState();
    _data = dataClass.itemPlanejadosString(widget._tarefa);
    _legenda = dataClass.itemPlanejadosLegenda(widget._tarefa);
    _text = "$_data $_legenda";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: _data.contains("atrasada") ? UiText.headline9 : UiText.headline1,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
