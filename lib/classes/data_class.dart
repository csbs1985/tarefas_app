import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataClass {
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
}
