import 'package:flutter/material.dart';
import 'package:tarefas_app/class/data_class.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiBorder {
  static const double circle = 40;
  static const double none = 0;
  static const double rounded = 6;

  static BoxDecoration borda = const BoxDecoration(
    border: Border(
      top: BorderSide(
        width: 1,
        color: UiColor.border,
      ),
    ),
  );
}

class BorderClass {
  final DataClass _dataClass = DataClass();

  Border borderAtrasada(Map<String, dynamic> tarefa) {
    String dataTarefa = _dataClass.itemPlanejadosString(tarefa);

    return dataTarefa.contains("atrasada")
        ? Border.all(color: UiColor.atrasada)
        : Border.all(color: UiColor.item_tarefa);
  }
}
