class FormaMovimentacaoModel {
  final FormaPagamentoEnum tipo;

  FormaMovimentacaoModel({
    required this.tipo,
  });
}

enum FormaPagamentoEnum {
  boleto('boleto'),
  cartaoCredito('cartão de crédito'),
  cartaoDebito('cartão de débito'),
  cheque('cheque'),
  criptomoeda('criptomoeda'),
  debito('débito'),
  debitoAutomatico('débito automatico'),
  dinheiro('dinheiro'),
  doc('doc'),
  pix('pix'),
  ted('ted');

  final String value;
  const FormaPagamentoEnum(this.value);
}

final List<FormaMovimentacaoModel> ListaFormaPagamento = [
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.boleto),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.cartaoCredito),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.cartaoDebito),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.cheque),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.criptomoeda),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.debito),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.debitoAutomatico),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.dinheiro),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.doc),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.pix),
  FormaMovimentacaoModel(tipo: FormaPagamentoEnum.ted),
];
