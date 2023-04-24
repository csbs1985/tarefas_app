class RecorrenciaModel {
  late RecorrenciaEnum tipo;

  RecorrenciaModel({
    required this.tipo,
  });
}

enum RecorrenciaEnum {
  diario('diario'),
  semanal('semanal'),
  mensal('mensal'),
  anual('anual'),
  diasSemana('dias da semana'),
  fimSemana('fim de semana'),
  aCada('a cada'),
  parcelas('parcelas'),
  unica('única');

  final String value;
  const RecorrenciaEnum(this.value);
}

final List<RecorrenciaModel> ListaFrequencia = [
  RecorrenciaModel(tipo: RecorrenciaEnum.diario),
  RecorrenciaModel(tipo: RecorrenciaEnum.semanal),
  RecorrenciaModel(tipo: RecorrenciaEnum.mensal),
  RecorrenciaModel(tipo: RecorrenciaEnum.anual),
  RecorrenciaModel(tipo: RecorrenciaEnum.diasSemana),
  RecorrenciaModel(tipo: RecorrenciaEnum.fimSemana),
  RecorrenciaModel(tipo: RecorrenciaEnum.aCada),
  RecorrenciaModel(tipo: RecorrenciaEnum.parcelas),
  RecorrenciaModel(tipo: RecorrenciaEnum.unica),
];
