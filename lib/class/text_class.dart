import 'package:tarefas_app/class/data_class.dart';

class TextClass {
  final DataClass dataClass = DataClass();

  String stringLegenda(Map<String, dynamic> tarefa) {
    String data = dataClass.itemPlanejadosString(tarefa);
    String legenda = dataClass.itemPlanejadosLegenda(tarefa);
    return "$data $legenda";
  }
}
