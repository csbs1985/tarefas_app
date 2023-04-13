import 'dart:convert';

class FrequenciaModel {
  late String text;
  late int value;
  late int? quantidadeParcelas;
  late int? iniciarPacelas;
  late String? aCada;
  late String? periodo;

  FrequenciaModel({
    required this.text,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'value': value,
    };
  }
}

final List<FrequenciaModel> ListaFrequencia = [
  FrequenciaModel(text: FrequenciaEnum.diariamente.value, value: 0),
  FrequenciaModel(text: FrequenciaEnum.semanalmente.value, value: 1),
  FrequenciaModel(text: FrequenciaEnum.mensalmente.value, value: 2),
  FrequenciaModel(text: FrequenciaEnum.anualmente.value, value: 3),
  FrequenciaModel(text: FrequenciaEnum.diasSemana.value, value: 4),
  FrequenciaModel(text: FrequenciaEnum.fimSemana.value, value: 5),
  FrequenciaModel(text: FrequenciaEnum.aCada.value, value: 6),
  FrequenciaModel(text: FrequenciaEnum.parcelas.value, value: 7),
  FrequenciaModel(text: FrequenciaEnum.unica.value, value: 8),
];

enum FrequenciaEnum {
  diariamente('diariamente'),
  semanalmente('semanalmente'),
  mensalmente('mensalmente'),
  anualmente('anualmente'),
  diasSemana('dias da semana'),
  fimSemana('fim de semana'),
  aCada('a cada'),
  parcelas('parcelas'),
  unica('única');

  final String value;
  const FrequenciaEnum(this.value);
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
