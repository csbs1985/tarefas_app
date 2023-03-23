import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/task_class.dart';
import 'package:tarefas_app/classes/tipo_select_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/input/endereco_input.dart';
import 'package:tarefas_app/input/valor_input.dart';
import 'package:tarefas_app/input/calendar_input%20.dart';
import 'package:tarefas_app/input/anotacao_input.dart';
import 'package:tarefas_app/input/notificacao_input%20.dart';
import 'package:tarefas_app/input/text_input.dart';
import 'package:tarefas_app/input/select_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:uuid/uuid.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final Uuid uuid = const Uuid();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tipoTarefaController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();
  final TextEditingController _notificacaoController = TextEditingController();
  final TextEditingController _frequenciaController = TextEditingController();
  final MoneyMaskedTextController _valorController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final TextEditingController _tipoMovimentacaoController =
      TextEditingController();
  final TextEditingController _formaPagamentoController =
      TextEditingController();
  final TextEditingController _anotacaoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _anexoController = TextEditingController();

  late Map<String, dynamic>? _task;

  @override
  void initState() {
    super.initState();
    if (currentTask.value != null) popularController;
  }

  void popularController() {
    _nomeController.text = currentTask.value!.nome;
    _tipoTarefaController.text = currentTask.value!.tipoTarefa as String;
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
    _anexoController.text = currentTask.value!.anexo!;
  }

  void confirmTask() {
    _task = {
      'id': uuid.v4(),
      'idUsuario': 'dddddddd',
      'nome': _nomeController.text,
      'tipoTarefa': _tipoTarefaController.text,
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
      'anexo': _anexoController.text,
    };

    // currentTask.value = _task as TaskModel?;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _tipoTarefaController.dispose();
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
    _anexoController.dispose();

    currentTask.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColor.modal,
      appBar: AppBar(
        backgroundColor: UiColor.modal,
        toolbarHeight: 64,
        leading: IconButton(
          icon: SvgPicture.asset(UiSvg.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: const Text(
          TAREFA,
          style: UiText.titleTask,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        child: ValueListenableBuilder(
            valueListenable: currentTask,
            builder: (BuildContext context, task, _) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    EnderecoInput(
                      controller: _enderecoController,
                      callback: (value) => _enderecoController.text = value,
                    ),
                    TextInput(
                      controller: _nomeController,
                      label: TAREFA,
                      callback: (value) => _nomeController.text = value,
                    ),
                    SelectInput(
                      controller: _tipoTarefaController,
                      tipo: TipoSelectEnum.tipoTarefa,
                      callback: (value) => {
                        setState(() => _tipoTarefaController.text = value),
                      },
                    ),
                    SelectInput(
                      controller: _frequenciaController,
                      tipo: TipoSelectEnum.frequencia,
                      callback: (value) => {
                        setState(() => _frequenciaController.text = value),
                      },
                    ),
                    SelectInput(
                      controller: _diaController,
                      tipo: TipoSelectEnum.dia,
                      callback: (value) => {
                        setState(() => _diaController.text = value),
                      },
                    ),
                    SelectInput(
                      controller: _tipoMovimentacaoController,
                      tipo: TipoSelectEnum.tipoMovimentacao,
                      callback: (value) => {
                        setState(
                            () => _tipoMovimentacaoController.text = value),
                      },
                    ),
                    SelectInput(
                      controller: _formaPagamentoController,
                      tipo: TipoSelectEnum.formaMovimentacao,
                      callback: (value) => {
                        setState(() => _formaPagamentoController.text = value),
                      },
                    ),
                    CalendarInput(
                      controller: _diaController,
                      callback: (value) => {
                        setState(() => _diaController.text = value),
                      },
                    ),
                    NotificacaoInput(
                      controller: _notificacaoController,
                      callback: (value) => {
                        setState(() => _notificacaoController.text = value),
                      },
                    ),
                    SelectInput(
                      controller: _anexoController,
                      tipo: TipoSelectEnum.TipoAnexo,
                      callback: (value) => {
                        setState(() => _anexoController.text = value),
                      },
                    ),
                    ValorInput(
                      controller: _valorController,
                      callback: (value) => _valorController.text = value,
                    ),
                    AnotacaoInput(
                      controller: _anotacaoController,
                      callback: (value) => _anotacaoController.text = value,
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        onPressed: () => confirmTask(),
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
