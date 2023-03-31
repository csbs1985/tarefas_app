class HorarioClass {
  Map<String, int> horarioDateNowDouble() {
    DateTime agora = DateTime.now();

    int hora = agora.hour;
    int minuto = agora.minute;

    return {"hora": hora, "minuto": minuto};
  }

  Map<String, int> separarHoraMinuto(String time) {
    int hora = int.parse(time.substring(0, 2));
    int minuto = int.parse(time.substring(3, 5));
    return {"hora": hora, "minuto": minuto};
  }

  String unirDataHora(String data, String hora) {
    String dataFormat = data.replaceAll(" 00:00:00.000", "");
    String dataHorario = '$dataFormat $hora:00.000';
    return dataHorario;
  }
}
