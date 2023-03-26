import 'package:flutter/material.dart';

class HorarioClass {
  TextEditingController somenteHorario(String dataHora) {
    if (dataHora != "") {
      List<String> partes = dataHora.split(" às ");
      return TextEditingController(text: partes[1]);
    }

    return TextEditingController(text: "");
  }

  Map<String, int> horarioDateNowDouble() {
    DateTime agora = DateTime.now();

    int hora = agora.hour;
    int minuto = agora.minute;

    return {"hora": hora, "minuto": minuto};
  }

  Map<String, int> horarioStringDouble(String time) {
    List<String> horaMinuto = time.split('h');

    int hora = int.parse(horaMinuto[0]);
    int minuto = int.parse(horaMinuto[1].substring(0, 2));

    return {"hora": hora, "minuto": minuto};
  }
}
