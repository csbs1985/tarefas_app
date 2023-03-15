class TarefaModel {
  late String text;
  late int value;

  TarefaModel(
    this.text,
    this.value,
  );
}

class TipoTarefaClass {
  var tipoTarefa = [
    {
      'text': 'Aniversário',
      'value': 0,
    },
    {
      'text': 'Evento',
      'value': 1,
    },
    {
      'text': 'Financeiro',
      'value': 2,
    },
    {
      'text': 'Lembrete',
      'value': 3,
    },
    {
      'text': 'Ligar',
      'value': 4,
    },
  ];
}

enum TipoTarefaEnum {
  aniversario('aniversário'),
  evento('evento'),
  financeiro('financeiro'),
  lembrete('lembrete'),
  ligar('ligar');

  final String value;
  const TipoTarefaEnum(this.value);
}
