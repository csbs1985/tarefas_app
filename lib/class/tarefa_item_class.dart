import 'package:tarefas_app/class/data_class.dart';

class TarefaItemClass {
  final DataClass _dataClass = DataClass();

  String tipoItem(Map<String, dynamic> tarefa) {
    String tipo = _dataClass.itemPlanejadosString(tarefa);

    if (tarefa['concluida']) return TipoItemTarefaEnum.fechada.value;
    if (tipo.contains("atrasada")) return TipoItemTarefaEnum.atrasada.value;
    return TipoItemTarefaEnum.normal.value;
  }
}

enum TipoItemTarefaEnum {
  normal('normal'),
  atrasada('atrasada'),
  fechada('fechada');

  final String value;
  const TipoItemTarefaEnum(this.value);
}
