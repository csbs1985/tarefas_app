import 'package:intl/intl.dart';

class DataClass {
  DateTime formatDateTime(String data) {
    DateTime dataTime = DateFormat('dd/MM/yyyy').parse(data);
    return dataTime;
  }

  String formatDateExtenso(String data) {
    DateTime dataTime = DateFormat('dd/MM/yyyy').parse(data);
    String dataFormatada =
        DateFormat('d \'de\' MMM \'de\' y', 'pt_Br').format(dataTime);

    return dataFormatada;
  }

  String formatNotificacao(String value) {
    DateTime dataHora = DateTime.parse(value);
    String dataStr = DateFormat("dd 'de' MMMM", 'pt_Br').format(dataHora);
    String horaStr = DateFormat("HH'h'mm'm'").format(dataHora);
    String resultado = "dia $dataStr às $horaStr";
    return resultado;
  }
}
