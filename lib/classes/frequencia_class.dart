class FrequenciaModel {
  late String text;
  late int value;

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
  FrequenciaModel(text: FrequenciaEnum.personalizado.value, value: 0),
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
  personalizado('personalizado');

  final String value;
  const FrequenciaEnum(this.value);
}
