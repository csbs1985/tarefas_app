class FormaPagamentoModel {
  final String text;
  final int value;

  FormaPagamentoModel({
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

final List<FormaPagamentoModel> ListaFormaPagamento = [
  FormaPagamentoModel(text: FormaPagamentoEnum.boleto.value, value: 0),
  FormaPagamentoModel(text: FormaPagamentoEnum.cartaoCredito.value, value: 1),
  FormaPagamentoModel(text: FormaPagamentoEnum.cartaoDebito.value, value: 2),
  FormaPagamentoModel(text: FormaPagamentoEnum.cheque.value, value: 3),
  FormaPagamentoModel(text: FormaPagamentoEnum.criptomoeda.value, value: 4),
  FormaPagamentoModel(text: FormaPagamentoEnum.debito.value, value: 5),
  FormaPagamentoModel(
      text: FormaPagamentoEnum.debitoAutomatico.value, value: 6),
  FormaPagamentoModel(text: FormaPagamentoEnum.dinheiro.value, value: 7),
  FormaPagamentoModel(text: FormaPagamentoEnum.doc.value, value: 8),
  FormaPagamentoModel(text: FormaPagamentoEnum.pix.value, value: 9),
  FormaPagamentoModel(text: FormaPagamentoEnum.ted.value, value: 9),
];

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
