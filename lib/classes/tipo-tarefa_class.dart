class TarefaModel {
  final String text;
  final int value;

  TarefaModel({
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

final List<TarefaModel> ListaTipoTarefa = [
  TarefaModel(text: TipoTarefaEnum.aniversario.value, value: 0),
  TarefaModel(text: TipoTarefaEnum.evento.value, value: 1),
  TarefaModel(text: TipoTarefaEnum.financeiro.value, value: 2),
  TarefaModel(text: TipoTarefaEnum.lembrete.value, value: 3),
  TarefaModel(text: TipoTarefaEnum.ligar.value, value: 4),
];

enum TipoTarefaEnum {
  aniversario('aniversário'),
  evento('evento'),
  financeiro('financeiro'),
  lembrete('lembrete'),
  ligar('ligar');

  final String value;
  const TipoTarefaEnum(this.value);
}
