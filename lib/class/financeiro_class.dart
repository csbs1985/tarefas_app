import 'package:tarefas_app/class/forma-pagamento_class.dart';
import 'package:tarefas_app/class/tipo-movimentacao_class.dart';

class FinanceiroModel {
  late FormaMovimentacaoModel formaMovimentacao;
  late TipoMovimentacaoModel tipoMovimentacao;
  late double valor;

  FinanceiroModel({
    required this.valor,
    required this.tipoMovimentacao,
    required this.formaMovimentacao,
  });
}
