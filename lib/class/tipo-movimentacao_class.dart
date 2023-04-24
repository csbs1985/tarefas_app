class TipoMovimentacaoModel {
  final TipoMovimentacaoEnum tipo;

  TipoMovimentacaoModel({
    required this.tipo,
  });
}

enum TipoMovimentacaoEnum {
  pagamento('pagamento'),
  recebimento('recebimento');

  final String value;
  const TipoMovimentacaoEnum(this.value);
}

final List<TipoMovimentacaoModel> ListaTipoMovimentacao = [
  TipoMovimentacaoModel(tipo: TipoMovimentacaoEnum.pagamento),
  TipoMovimentacaoModel(tipo: TipoMovimentacaoEnum.recebimento),
];
