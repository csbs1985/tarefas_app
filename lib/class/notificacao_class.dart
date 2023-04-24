class NotificacaoModel {
  late int dia;
  late int mes;
  late NotificacaoSituacaoEnum situacao;

  NotificacaoModel(
    this.dia,
    this.mes,
    this.situacao,
  );
}

enum NotificacaoSituacaoEnum {
  aberta('aberta'),
  fechada('fechada');

  final String value;
  const NotificacaoSituacaoEnum(this.value);
}
