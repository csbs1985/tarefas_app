import 'package:flutter/material.dart';

class CalendarioClasss {
  TextEditingController somenteData(String dataHora) {
    if (dataHora != "") {
      List<String> partes = dataHora.split(" às ");
      return TextEditingController(text: partes[0]);
    }

    return TextEditingController(text: "");
  }

  stringToDatetime(value) {
    if (value != "") {
      String dateString = value;
      DateTime dateTime = DateTime.parse(dateString);
      return dateTime;
    }
  }
}
