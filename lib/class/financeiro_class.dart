import 'package:tarefas_app/class/forma-pagamento_class.dart';
import 'package:tarefas_app/class/tipo-movimentacao_class.dart';

class FinanceiroModel {
  late double valor;
  late int parcelaAtual;
  late TipoMovimentacaoModel tipoMovimentacao;
  late FormaMovimentacaoModel formaMovimentacao;

  FinanceiroModel({
    required this.valor,
    required this.tipoMovimentacao,
    required this.formaMovimentacao,
    required this.parcelaAtual,
  });
}
