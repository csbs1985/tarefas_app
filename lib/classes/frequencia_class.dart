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
];

enum FrequenciaEnum {
  diariamente('diariamente'),
  semanalmente('semanalmente'),
  mensalmente('mensalmente'),
  anualmente('anualmente'),
  diasSemana('dias da semana'),
  fimSemana('fim de semana'),
  aCada('a cada'),
  parcelas('parcelas');

  final String value;
  const FrequenciaEnum(this.value);
}

class FrequenciaClass {
  separarFrequencia(String frequencia) {
    Map<String, dynamic> jsonMap = jsonDecode(frequencia);
    return jsonMap;
  }
}
