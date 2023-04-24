class NotificacaoModel {
  late String dataHora;
  late NotificacaoSituacaoEnum situacao;

  NotificacaoModel(
    this.dataHora,
    this.situacao,
  );
}

enum NotificacaoSituacaoEnum {
  aberta('aberta'),
  fechada('fechada');

  final String value;
  const NotificacaoSituacaoEnum(this.value);
}
