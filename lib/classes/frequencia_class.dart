class FrequenciaModel {
  late String text;
  late int value;

  FrequenciaModel(
    this.text,
    this.value,
  );
}

enum FrequenciaEnum {
  diariamente('diariamente'),
  semanalmente('semanalmente'),
  mensalmente('mensalmente'),
  anualmente('anualmente'),
  diasSemana('diasSemana'),
  fimSemana('fimSemana'),
  aCada('aCada'),
  parcelas('parcelas'),
  personalizado('personalizado');

  final String value;
  const FrequenciaEnum(this.value);
}
