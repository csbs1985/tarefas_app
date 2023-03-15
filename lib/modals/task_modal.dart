import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/carregamento_class.dart';
import 'package:tarefas_app/classes/forma-pagamento_class.dart';
import 'package:tarefas_app/classes/frequencia_class.dart';
import 'package:tarefas_app/classes/task_class.dart';
import 'package:tarefas_app/classes/tipo-movimentacao_class.dart';
import 'package:tarefas_app/classes/tipo-tarefa_class.dart';
import 'package:tarefas_app/input/amount_input.dart';
import 'package:tarefas_app/input/select_input.dart';
import 'package:tarefas_app/input/text_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:uuid/uuid.dart';

class TaskModal extends StatefulWidget {
  const TaskModal({super.key});

  @override
  State<TaskModal> createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final Uuid uuid = const Uuid();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _tipoTarefeController = TextEditingController();
  TextEditingController _diaController = TextEditingController();
  TextEditingController _notificacaoController = TextEditingController();
  TextEditingController _frequenciaController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  TextEditingController _tipoMovimentacaoController = TextEditingController();
  TextEditingController _formaPagamentoController = TextEditingController();
  TextEditingController _anotacaoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _horarioController = TextEditingController();
  TextEditingController _linkController = TextEditingController();

  late Map<String, dynamic>? _task;

  @override
  void initState() {
    super.initState();

    if (currentTask.value != null) popularController;
  }

  void popularController() {
    _nomeController.text = currentTask.value!.nome;
    _tipoTarefeController.text = currentTask.value!.tipoTarefa as String;
    _diaController.text = currentTask.value!.dia;
    _notificacaoController.text = currentTask.value!.notificacao as String;
    _frequenciaController.text = currentTask.value!.frequencia as String;
    _valorController.text = currentTask.value!.valor!;
    _tipoMovimentacaoController.text =
        currentTask.value!.tipoMovimentacao as String;
    _formaPagamentoController.text = currentTask.value!.formaPagamento!;
    _anotacaoController.text = currentTask.value!.anotacao!;
    _telefoneController.text = currentTask.value!.telefone as String;
    _enderecoController.text = currentTask.value!.endereco as String;
    _horarioController.text = currentTask.value!.horario!;
    _linkController.text = currentTask.value!.link!;
  }

  void confirmTask() {
    _task = {
      'id': uuid.v4(),
      'idUsuario': 'dddddddd',
      'nome': _nomeController.text,
      'tipoTarefa': _tipoTarefeController.text,
      'dia': _diaController.text,
      'notificacao': _notificacaoController.text,
      'frequencia': _frequenciaController.text,
      'valor': _valorController.text,
      'tipoMovimentacao': _tipoMovimentacaoController.text,
      'formaPagamento': _valorController.text,
      'anotacao': _anotacaoController.text,
      'telefone': _telefoneController.text,
      'endereco': _enderecoController.text,
      'horario': _horarioController.text,
      'link': _valorController.text,
    };

    currentTask.value = _task as TaskModel?;
    print(currentTask.value);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _tipoTarefeController.dispose();
    _diaController.dispose();
    _notificacaoController.dispose();
    _frequenciaController.dispose();
    _valorController.dispose();
    _tipoMovimentacaoController.dispose();
    _formaPagamentoController.dispose();
    _anotacaoController.dispose();
    _telefoneController.dispose();
    _enderecoController.dispose();
    _horarioController.dispose();
    _linkController.dispose();

    currentTask.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: UiColor.modal,
      appBar: AppBar(
        backgroundColor: UiColor.modal,
        automaticallyImplyLeading: false,
        toolbarHeight: 64,
        title: Text(
          'Tarefa',
          style: UiText.titleTask,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInput(
                controller: _nomeController,
                label: 'Tarefa',
                callback: (value) => print(value),
              ),
              SelectInput(
                controller: _tipoTarefeController,
                label: 'Tipo de tarefa',
                body: ListaTipoTarefa,
                callback: (value) => print(value),
              ),
              SelectInput(
                controller: _frequenciaController,
                label: 'Frequência',
                body: ListaFrequencia,
                callback: (value) => print(value),
              ),
              SelectInput(
                controller: _tipoMovimentacaoController,
                label: 'Movimentação financeira',
                body: ListaTipoMovimentacao,
                callback: (value) => print(value),
              ),
              SelectInput(
                controller: _formaPagamentoController,
                label: 'Forma de movimentação',
                body: ListaFormaPagamento,
                callback: (value) => print(value),
              ),
              SelectInput(
                controller: _formaPagamentoController,
                label: 'Anexo',
                body: ListaAnexo,
                callback: (value) => print(value),
              ),
              TextInput(
                controller: _diaController,
                label: 'Dia',
                keyboard: TextInputType.number,
                callback: (value) => print(value),
              ),
              AmountInput(
                controller: _valorController,
                label: 'Valor R\$',
                callback: (value) => print(value),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        onPressed: () => confirmTask,
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
