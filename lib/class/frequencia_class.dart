import 'dart:convert';
import 'package:tarefas_app/class/a_cada_class.dart';
import 'package:tarefas_app/class/parcela_model.dart';
import 'package:tarefas_app/class/recorrencia_class.dart';

class FrequenciaModel {
  late ACadaModel aCada;
  late RecorrenciaModel recorrencia;
  late ParcelaModel parcela;

  FrequenciaModel({
    required this.aCada,
    required this.recorrencia,
    required this.parcela,
  });
}

class FrequenciaClass {
  String mapToString(Map<String, dynamic> frequnecia) {
    return json.encode(frequnecia, toEncodable: (value) => value ?? "");
  }

  Map<String, dynamic> stringToMap(String frequencia) {
    Map<String, dynamic> retorno = jsonDecode(frequencia);
    return retorno;
  }

  formatFrequencia(String frequencia) {
    Map<String, dynamic> format = <String, dynamic>{};

    if (frequencia.isNotEmpty) {
      var jsonMap = stringToMap(frequencia);

      format = {
        'frequencia': jsonMap['frequencia'] ?? "",
        'aCada': jsonMap['aCada'] ?? "",
        'periodo': jsonMap['periodo'] ?? "",
        'parcelas': jsonMap['parcelas'] ?? "",
        'inicio': jsonMap['inicio'] ?? "",
      };
    }

    return format;
  }
}
