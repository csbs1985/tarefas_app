import 'package:flutter/material.dart';

class CalendarioClasss {
  TextEditingController somenteData(String dataHora) {
    TextEditingController controller = TextEditingController();

    if (dataHora != "") {
      List<String> partes = dataHora.split(" às ");
      return TextEditingController(text: partes[0]);
    }

    return TextEditingController(text: "");
  }
}
