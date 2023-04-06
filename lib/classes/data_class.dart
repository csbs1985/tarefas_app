import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/classes/tipo-tarefa_class.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class DataClass {
  final EnderecoClass _enderecoClass = EnderecoClass();

  TextEditingController formatDataSomente(String dataHora) {
    if (dataHora != "") {
      List<String> partes = dataHora.split(" às ");
      return TextEditingController(text: partes[0]);
    }

    return TextEditingController(text: "");
  }

  String formatDataCalendario(String data) {
    DateTime date = DateTime.parse(data);
    String dataFormatada =
        DateFormat("'dia' dd 'de' MMMM", 'pt_Br').format(date);
    return dataFormatada;
  }

  String formatDataNotificacao(String value) {
    if (value.isNotEmpty) {
      DateTime dataHora = DateTime.parse(value);
      String dataStr = DateFormat("dd 'de' MMMM", 'pt_Br').format(dataHora);
      String horaStr = DateFormat("HH'h'mm'm'").format(dataHora);
      return "dia $dataStr às $horaStr";
    }
    return "";
  }

  formatDataStringToDatetime(value) {
    if (value != "") {
      String dateString = value;
      DateTime dateTime = DateTime.parse(dateString);
      return dateTime;
    }
  }

  String unirDataHora(String data, String hora) {
    String dataFormat = data.substring(0, 10);
    return '$dataFormat $hora';
  }

  formatDiaSemana(Map<String, dynamic> tarefa) {
    final now = DateTime.now();
    final date =
        DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(tarefa['notificacao']);
    final diff = date.difference(now).inDays;
    String dataFormatada = '';

    if (diff <= -2)
      dataFormatada = 'atrasada';
    else if (diff == -1)
      dataFormatada = 'ontem';
    else if (diff == 0)
      dataFormatada = 'hoje';
    else if (diff == 1)
      dataFormatada = 'amanhã';
    else if (diff > 1 && diff <= 7)
      dataFormatada = DateFormat('EEE', 'pt_BR').format(date);
    else
      dataFormatada = DateFormat('dd/MM').format(date);

    return Text(
      formatLegenda(tarefa, dataFormatada),
      style: diff <= -1 ? UiText.headline9 : UiText.headline1,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String formatLegenda(Map<String, dynamic> tarefa, String dataFormatada) {
    if (tarefa['tipoTarefa'] == TipoTarefaEnum.aniversario.value)
      return "$dataFormatada \u2022 ${formatDataCalendario(tarefa['dia'])}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.financeiro.value)
      return "$dataFormatada \u2022 R\$ ${tarefa['valor']}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.lembrete.value)
      return "$dataFormatada \u2022${formatDataCalendario(tarefa['dia'])}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.ligar.value)
      return "$dataFormatada \u2022 ${tarefa['telefone']}";
    else {
      return tarefa['endereco'] == ""
          ? "$dataFormatada \u2022 url:${tarefa['link']}"
          : "$dataFormatada \u2022 ${_enderecoClass.montarEnderecoString(tarefa['endereco'])}";
    }
  }
}
