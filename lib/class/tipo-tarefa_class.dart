class TipoTarefaModel {
  final TipoTarefaEnum tipo;

  TipoTarefaModel({
    required this.tipo,
  });
}

final List<TipoTarefaModel> ListaTipoTarefa = [
  TipoTarefaModel(tipo: TipoTarefaEnum.aniversario),
  TipoTarefaModel(tipo: TipoTarefaEnum.evento),
  TipoTarefaModel(tipo: TipoTarefaEnum.financeiro),
  TipoTarefaModel(tipo: TipoTarefaEnum.lembrete),
  TipoTarefaModel(tipo: TipoTarefaEnum.ligar),
];

enum TipoTarefaEnum {
  aniversario('aniversario'),
  evento('evento'),
  financeiro('financeiro'),
  lembrete('lembrete'),
  ligar('ligar');

  final String value;
  const TipoTarefaEnum(this.value);
}
