class FormaMovimentacaoModel {
  final String forma;

  FormaMovimentacaoModel({
    required this.forma,
  });

  Map<String, dynamic> toMap() {
    return {'forma': forma};
  }
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
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.boleto.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.cartaoCredito.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.cartaoDebito.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.cheque.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.criptomoeda.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.debito.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.debitoAutomatico.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.dinheiro.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.doc.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.pix.value),
  FormaMovimentacaoModel(forma: FormaPagamentoEnum.ted.value),
];
