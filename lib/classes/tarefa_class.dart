import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/data_class.dart';
import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/classes/frequencia_class.dart';
import 'package:tarefas_app/classes/notificacao_class.dart';
import 'package:tarefas_app/classes/tipo-movimentacao_class.dart';
import 'package:tarefas_app/classes/tipo-tarefa_class.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

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
  late bool aberto;
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
    this.aberto,
    this.dataNotificacao,
  );
}

class TarefaClass {
  final DataClass _dataClass = DataClass();
  final EnderecoClass _enderecoClass = EnderecoClass();
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();

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

  SvgPicture svgPicture(String tarefa) {
    if (tarefa == TipoTarefaEnum.aniversario.value)
      return SvgPicture.asset(UiSvg.aniversario);
    if (tarefa == TipoTarefaEnum.evento.value)
      return SvgPicture.asset(UiSvg.evento);
    if (tarefa == TipoTarefaEnum.financeiro.value)
      return SvgPicture.asset(UiSvg.financeiro);
    if (tarefa == TipoTarefaEnum.lembrete.value)
      return SvgPicture.asset(UiSvg.lembrete);
    return SvgPicture.asset(UiSvg.ligar);
  }

  String formatLegenda(Map<String, dynamic> tarefa) {
    if (tarefa['tipoTarefa'] == TipoTarefaEnum.aniversario.value)
      return "aniverário \u2022 ${_dataClass.formatDataCalendario(tarefa['dia'])}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.financeiro.value)
      return "financeiro \u2022 R\$ ${tarefa['valor']}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.lembrete.value)
      return "lembrete \u2022${_dataClass.formatDataCalendario(tarefa['dia'])}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.ligar.value)
      return "ligar \u2022 ${tarefa['telefone']}";
    else {
      return tarefa['endereco'] == ""
          ? "evento \u2022 url:${tarefa['link']}"
          : "evento \u2022 ${_enderecoClass.montarEnderecoString(tarefa['endereco'])}";
    }
  }

  String formatDataNotificacao(data) {
    DateTime dateTime = DateTime.parse(data.replaceAll(" às ", ""));
    return dateTime.toString();
  }
}
