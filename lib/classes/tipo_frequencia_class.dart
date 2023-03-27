class TipoFrequenciaModel {
  late String text;
  late int value;

  TipoFrequenciaModel({
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

final List<TipoFrequenciaModel> ListaTipoFrequencia = [
  TipoFrequenciaModel(text: TipoFrequenciaEnum.dias.value, value: 0),
  TipoFrequenciaModel(text: TipoFrequenciaEnum.semanas.value, value: 1),
  TipoFrequenciaModel(text: TipoFrequenciaEnum.meses.value, value: 2),
  TipoFrequenciaModel(text: TipoFrequenciaEnum.anos.value, value: 3),
];

enum TipoFrequenciaEnum {
  dias('dias'),
  semanas('semanas'),
  meses('meses'),
  anos('anos');

  final String value;
  const TipoFrequenciaEnum(this.value);
}
