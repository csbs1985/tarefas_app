class TipoMovimentacaoModel {
  final String text;
  final int value;

  TipoMovimentacaoModel({
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

final List<TipoMovimentacaoModel> ListaTipoMovimentacao = [
  TipoMovimentacaoModel(text: TipoMovimentacaoEnum.pagamento.value, value: 0),
  TipoMovimentacaoModel(text: TipoMovimentacaoEnum.recebimento.value, value: 1),
];

enum TipoMovimentacaoEnum {
  pagamento('pagamento'),
  recebimento('recebimento');

  final String value;
  const TipoMovimentacaoEnum(this.value);
}
