import 'package:flutter/material.dart';
import 'package:tarefas_app/class/data_class.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class ColorClass {
  final DataClass dataClass = DataClass();

  Color colorAtrasada(Map<String, dynamic> tarefa) {
    String dataTarefa = dataClass.itemPlanejadosString(tarefa);
    return dataTarefa.contains("atrasada")
        ? UiColor.atrasada
        : UiColor.item_tarefa;
  }
}
