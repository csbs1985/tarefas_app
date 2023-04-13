import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/class/endereco_class.dart';
import 'package:tarefas_app/class/frequencia_class.dart';
import 'package:tarefas_app/class/notificacao_class.dart';
import 'package:tarefas_app/class/tipo-movimentacao_class.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/modal/tarefa_modal.dart';
import 'package:tarefas_app/theme/ui_color.dart';
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

  void openModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => const TarefaModal(),
    );
  }
}
