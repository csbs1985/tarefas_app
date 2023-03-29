import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/classes/frequencia_class.dart';
import 'package:tarefas_app/classes/notificacao_class.dart';
import 'package:tarefas_app/classes/tipo-movimentacao_class.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/widget/toast_widget.dart';

ValueNotifier<TarefaModel?> currentTask = ValueNotifier<TarefaModel?>(null);

class TarefaModel {
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
  late List<String?> anexo;

  TarefaModel(
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

class TarefaClass {
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();
  final ToastWidget _toastWidget = ToastWidget();

  postTarefa(Map<String, dynamic> tarefa) async {
    try {
      await _tarefaFirebase.postTarefa(tarefa);
    } on FirebaseAuthException catch (error) {
      debugPrint('ERRO-TAREFA-POST: $error');
    }
  }
}
