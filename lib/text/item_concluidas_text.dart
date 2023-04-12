import 'package:flutter/material.dart';
import 'package:tarefas_app/classes/data_class.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class ItemConcluidasText extends StatefulWidget {
  const ItemConcluidasText({
    super.key,
    required Map<String, dynamic> tarefa,
  }) : _tarefa = tarefa;

  final Map<String, dynamic> _tarefa;

  @override
  State<ItemConcluidasText> createState() => _ItemPlanejamentoTextState();
}

class _ItemPlanejamentoTextState extends State<ItemConcluidasText> {
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
      style: UiText.headline3,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
