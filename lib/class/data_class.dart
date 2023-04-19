import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefas_app/class/endereco_class.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';

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

  String unirHoraMinuto(int hora, int minuto) {
    String formatHora = hora < 10 ? '0$hora' : '$hora';
    String formatMinuto = minuto < 10 ? '0$minuto' : '$minuto';
    return '$formatHora:$formatMinuto:00.000';
  }

  String dataAtualHoraZero() {
    String dataHora = DateTime.now().toString();
    String dataFormat = dataHora.substring(0, 10);
    return '$dataFormat 00:00:00.000';
  }

  String itemPlanejadosString(Map<String, dynamic> tarefa) {
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
    return dataFormatada;
  }

  String itemPlanejadosLegenda(Map<String, dynamic> tarefa) {
    if (tarefa['tipoTarefa'] == TipoTarefaEnum.aniversario.value)
      return "\u2022 dê os parabêns";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.financeiro.value)
      return "\u2022 R\$ ${tarefa['valor']}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.lembrete.value)
      return "\u2022 ${tarefa['tarefa']}";
    else if (tarefa['tipoTarefa'] == TipoTarefaEnum.ligar.value)
      return "\u2022 ${tarefa['telefone']}";
    else {
      return tarefa['endereco'] == ""
          ? "\u2022 url:${tarefa['link']}"
          : "\u2022 ${_enderecoClass.montarEnderecoString(tarefa['endereco'])}";
    }
  }
}
