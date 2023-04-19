import 'package:tarefas_app/class/data_class.dart';
import 'package:tarefas_app/class/endereco_class.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';

class TextClass {
  final DataClass dataClass = DataClass();
  final EnderecoClass _enderecoClass = EnderecoClass();

  String stringLegenda(Map<String, dynamic> tarefa) {
    String data = dataClass.itemPlanejadosString(tarefa);
    String legenda = dataClass.itemPlanejadosLegenda(tarefa);
    return "$data $legenda";
  }

  String stringBodyNotification(Map<String, dynamic> tarefa) {
    String tipoTarefa = tarefa['tipoTarefa'];

    if (tipoTarefa == TipoTarefaEnum.aniversario.value)
      return "é hoje, dê os parabêns para ${tarefa['tarefa']}";
    if (tipoTarefa == TipoTarefaEnum.financeiro.value)
      return "dia de movimentação \u2022 R\$ ${tarefa['valor']}";
    if (tipoTarefa == TipoTarefaEnum.lembrete.value)
      return "você tem uma lembrança de ${tarefa['tarefa']}";
    if (tipoTarefa == TipoTarefaEnum.ligar.value)
      return "pegue seu telefone e digite ${tarefa['telefone']}";
    else {
      return tarefa['endereco'] != ""
          ? "este é o link:${tarefa['link']}"
          : "segue o endereço: ${_enderecoClass.montarEnderecoString(tarefa['endereco'])}";
    }
  }
}
