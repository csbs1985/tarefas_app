import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/classes/frequencia_model.dart';
import 'package:tarefas_app/classes/notificao_class.dart';
import 'package:tarefas_app/classes/tipo-movimentacao.dart';
import 'package:tarefas_app/classes/tipo-tarefa.class.dart';

class TaskModel {
  late String id;
  late String nome;
  late TarefaModel tipoTarefa;
  late String dia;
  late NotificacaoModel notificacao;
  late FrequenciaModel? frequencia;
  late String? valor;
  late TipoMovimentacaoModel? tipoMovimentacao;
  late String? FormaPagamento;
  late String? anotacao;
  late List<String>? telefone;
  late EnderecoModel? endereco;
  late String? horario;
  late String? link;

  TaskModel(
    this.id,
    this.nome,
    this.tipoTarefa,
    this.dia,
    this.notificacao,
    this.frequencia,
    this.valor,
    this.tipoMovimentacao,
    this.FormaPagamento,
    this.anotacao,
    this.telefone,
    this.endereco,
    this.horario,
    this.link,
  );
}
