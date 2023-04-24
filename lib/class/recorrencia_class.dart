class RecorrenciaModel {
  late RecorrenciaEnum periodo;

  RecorrenciaModel({
    required this.periodo,
  });
}

enum RecorrenciaEnum {
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
  const RecorrenciaEnum(this.value);
}

final List<RecorrenciaModel> ListaFrequencia = [
  RecorrenciaModel(periodo: RecorrenciaEnum.diariamente),
  RecorrenciaModel(periodo: RecorrenciaEnum.semanalmente),
  RecorrenciaModel(periodo: RecorrenciaEnum.mensalmente),
  RecorrenciaModel(periodo: RecorrenciaEnum.anualmente),
  RecorrenciaModel(periodo: RecorrenciaEnum.diasSemana),
  RecorrenciaModel(periodo: RecorrenciaEnum.fimSemana),
  RecorrenciaModel(periodo: RecorrenciaEnum.aCada),
  RecorrenciaModel(periodo: RecorrenciaEnum.parcelas),
  RecorrenciaModel(periodo: RecorrenciaEnum.unica),
];
