import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/class/endereco_class.dart';
import 'package:tarefas_app/class/frequencia_class.dart';
import 'package:tarefas_app/class/notificacao_class.dart';
import 'package:tarefas_app/class/tipo-movimentacao_class.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/modal/tarefa_modal.dart';
import 'package:tarefas_app/theme/ui_color.dart';

ValueNotifier<Map<String, dynamic>?> currentTarefa =
    ValueNotifier<Map<String, dynamic>?>(null);

class TarefaModel {
  late String id;
  late String dataCriacao;
  late String idUsuario;
  late String tarefa;
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
  late bool concluida;
  late String dataNotificacao;

  TarefaModel(
    this.id,
    this.dataCriacao,
    this.idUsuario,
    this.tarefa,
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
    this.concluida,
    this.dataNotificacao,
  );
}

class TarefaClass {
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();

  tarefaToMap(QueryDocumentSnapshot tarefa) {
    Map<String, dynamic> tarefaMap = {
      'id': tarefa['id'],
      'dataCriacao': tarefa['dataCriacao'],
      'idUsuario': tarefa['idUsuario'],
      'tarefa': tarefa['tarefa'],
      'tipoTarefa': tarefa['tipoTarefa'],
      'dia': tarefa['dia'],
      'notificacao': tarefa['notificacao'],
      'frequencia': tarefa['frequencia'],
      'valor': tarefa['valor'],
      'tipoMovimentacao': tarefa['tipoMovimentacao'],
      'formaPagamento': tarefa['formaPagamento'],
      'anotacao': tarefa['anotacao'],
      'telefone': tarefa['telefone'],
      'endereco': tarefa['endereco'],
      'horario': tarefa['horario'],
      'link': tarefa['link'],
      'anexo': tarefa['anexo'],
      'concluida': tarefa['concluida'],
    };

    return tarefaMap;
  }

  postTarefa(Map<String, dynamic> tarefa) async {
    try {
      await _tarefaFirebase.postTarefa(tarefa);
    } on FirebaseAuthException catch (error) {
      debugPrint('ERRO-TAREFA-POST: $error');
    }
  }

  pathTarefa(Map<String, dynamic> tarefa) async {
    try {
      await _tarefaFirebase.pathTarefa(tarefa);
    } on FirebaseAuthException catch (error) {
      debugPrint('ERRO-TAREFA-POST: $error');
    }
  }

  void openModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => const TarefaModal(),
    );
  }

  listToMap(List<dynamic> tarefas) {
    Map<String, dynamic>? tarefaItem;
    List<Map<String, dynamic>> listaTarefas = [];

    for (var item in tarefas) {
      tarefaItem = {
        'id': item['id'],
        'dataCriacao': item['dataCriacao'],
        'idUsuario': item['idUsuario'],
        'tarefa': item['tarefa'],
        'tipoTarefa': item['tipoTarefa'],
        'dia': item['dia'],
        'notificacao': item['notificacao'],
        'frequencia': item['frequencia'],
        'valor': item['valor'],
        'tipoMovimentacao': item['tipoMovimentacao'],
        'formaPagamento': item['formaPagamento'],
        'anotacao': item['anotacao'],
        'telefone': item['telefone'],
        'endereco': item['endereco'],
        'horario': item['horario'],
        'link': item['link'],
        'anexo': item['anexo'],
        'concluida': item['concluida'],
      };

      listaTarefas.add(tarefaItem);
    }

    return listaTarefas;
  }
}
