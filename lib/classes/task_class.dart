import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/classes/frequencia_class.dart';
import 'package:tarefas_app/classes/notificao_class.dart';
import 'package:tarefas_app/classes/tipo-movimentacao_class.dart';
import 'package:tarefas_app/classes/tipo-tarefa_class.dart';

ValueNotifier<TaskModel?> currentTask = ValueNotifier<TaskModel?>(null);

class TaskModel {
  late String id;
  late String idUsuario;
  late String nome;
  late TarefaModel tipoTarefa;
  late String dia;
  late NotificacaoModel notificacao;
  late FrequenciaModel? frequencia;
  late String? valor;
  late TipoMovimentacaoModel? tipoMovimentacao;
  late String? formaPagamento;
  late String? anotacao;
  late List<String>? telefone;
  late EnderecoModel? endereco;
  late String? horario;
  late String? link;
  late String? anexo;

  TaskModel(
    this.id,
    this.idUsuario,
    this.nome,
    this.tipoTarefa,
    this.dia,
    this.notificacao,
    this.frequencia,
    this.valor,
    this.tipoMovimentacao,
    this.formaPagamento,
    this.anotacao,
    this.telefone,
    this.endereco,
    this.horario,
    this.link,
    this.anexo,
  );
}
