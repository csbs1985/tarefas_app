import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/frequencia_class.dart';
import 'package:tarefas_app/classes/task_class.dart';
import 'package:tarefas_app/classes/tipo-tarefa_class.dart';
import 'package:tarefas_app/classes/tipo_select_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/input/anotacao_input.dart';
import 'package:tarefas_app/input/calendario_input.dart';
import 'package:tarefas_app/input/endereco_input.dart';
import 'package:tarefas_app/input/frequencia_input.dart';
import 'package:tarefas_app/input/horario_input.dart';
import 'package:tarefas_app/input/link_input.dart';
import 'package:tarefas_app/input/notificacao_input%20.dart';
import 'package:tarefas_app/input/telefone_input.dart';
import 'package:tarefas_app/input/texto_input.dart';
import 'package:tarefas_app/input/select_input.dart';
import 'package:tarefas_app/input/valor_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/toast_widget.dart';
import 'package:uuid/uuid.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({Key? key}) : super(key: key);

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  late FirebaseFirestore db;
  late FirebaseAuth auth;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final TarefaClass _tarefaClass = TarefaClass();
  final FrequenciaClass _frequenciaClass = FrequenciaClass();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Uuid _uuid = const Uuid();
  final ToastWidget _toastWidget = ToastWidget();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tipoTarefaController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();
  final TextEditingController _notificacaoController = TextEditingController();
  final TextEditingController _frequenciaController = TextEditingController();
  final MoneyMaskedTextController _valorController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
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

  Map<String, dynamic> _tarefa = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    if (currentTask.value != null) {
      popularController;
      return;
    }
    _tipoTarefaController.text = TipoTarefaEnum.aniversario.value;
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
    _anexoController.text = currentTask.value!.anexo as String;
  }

  bool candFrequencia() {
    if (_tipoTarefaController.text == TipoTarefaEnum.aniversario.value)
      return false;
    return true;
  }

  bool onlyFinanceiro() {
    return _tipoTarefaController.text == TipoTarefaEnum.financeiro.value
        ? true
        : false;
  }

  bool onlyEvento() {
    return _tipoTarefaController.text == TipoTarefaEnum.evento.value
        ? true
        : false;
  }

  bool onlyLigar() {
    return _tipoTarefaController.text == TipoTarefaEnum.ligar.value
        ? true
        : false;
  }

  void callbackTipoTarefa(String callback) {
    clearTask();

    if (callback == "") {
      _tipoTarefaController.text = ListaTipoTarefa.first.text;
      return;
    }
    _tipoTarefaController.text = callback;
  }

  void clearTask() {
    _tarefa.clear();

    _nomeController.clear();
    _tipoTarefaController.clear();
    _diaController.clear();
    _notificacaoController.clear();
    _frequenciaController.clear();
    _valorController.text = VALOR_INICIAL;
    _tipoMovimentacaoController.clear();
    _formaPagamentoController.clear();
    _anotacaoController.clear();
    _telefoneController.clear();
    _enderecoController.clear();
    _horarioController.clear();
    _linkController.clear();
    _anexoController.clear();
  }

  void confirmTask(BuildContext context) {
    if (_nomeController.text != "" && _notificacaoController.text != "") {
      _tarefa = {
        'id': _uuid.v4(),
        'idUsuario': 'idUsuarioTemp',
        'nome': _nomeController.text,
        'tipoTarefa': _tipoTarefaController.text,
        'dia': _diaController.text,
        'notificacao': _notificacaoController.text,
        'frequencia':
            _frequenciaClass.formatFrequencia(_frequenciaController.text),
        'valor': _valorController.text,
        'tipoMovimentacao': _tipoMovimentacaoController.text,
        'formaPagamento': _formaPagamentoController.text,
        'anotacao': _anotacaoController.text,
        'telefone': _telefoneController.text,
        'endereco': _enderecoController.text,
        'horario': _horarioController.text,
        'link': _linkController.text,
        'anexo': _anexoController.text,
      };

      try {
        _tarefaClass.postTarefa(_tarefa);
        _toastWidget.toast(context, ToastEnum.SUCESSO.value, TAREFA_SUCESSO);
        Navigator.pop(context);
      } on Exception {
        _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_ERRO_POST);
      }
    } else
      _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_VAZIA);
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
                    SelectInput(
                      controller: _tipoTarefaController,
                      tipo: TipoSelectEnum.tipoTarefa,
                      callback: (value) =>
                          setState(() => callbackTipoTarefa(value)),
                    ),
                    TextoInput(
                      controller: _nomeController,
                      label: TAREFA,
                      callback: (value) => _nomeController.text = value,
                    ),
                    if (candFrequencia())
                      FrequenciaInput(
                        controller: _frequenciaController,
                        callback: (value) =>
                            setState(() => _frequenciaController.text = value),
                      ),
                    CalendarioInput(
                      controller: _diaController,
                      callback: (value) =>
                          setState(() => _diaController.text = value),
                    ),
                    NotificacaoInput(
                      controller: _notificacaoController,
                      callback: (value) =>
                          setState(() => _notificacaoController.text = value),
                    ),
                    if (onlyFinanceiro())
                      SelectInput(
                        controller: _tipoMovimentacaoController,
                        tipo: TipoSelectEnum.tipoMovimentacao,
                        callback: (value) => setState(
                            () => _tipoMovimentacaoController.text = value),
                      ),
                    if (onlyFinanceiro())
                      SelectInput(
                        controller: _formaPagamentoController,
                        tipo: TipoSelectEnum.formaMovimentacao,
                        callback: (value) => setState(
                            () => _formaPagamentoController.text = value),
                      ),
                    if (onlyFinanceiro())
                      ValorInput(
                        controller: _valorController,
                        callback: (value) => _valorController.text = value,
                      ),
                    if (onlyEvento())
                      EnderecoInput(
                        controller: _enderecoController,
                        callback: (value) => _enderecoController.text = value,
                      ),
                    if (onlyEvento())
                      HorarioInput(
                        controller: _horarioController,
                        callback: (value) => _horarioController.text = value,
                      ),
                    if (onlyEvento())
                      LinkInput(
                        controller: _linkController,
                        callback: (value) => _linkController.text = value,
                      ),
                    if (onlyLigar())
                      TelefoneInput(
                        controller: _telefoneController,
                        callback: (value) => _telefoneController.text = value,
                      ),
                    AnotacaoInput(
                      controller: _anotacaoController,
                      callback: (value) => _anotacaoController.text = value,
                    ),
                    // AnexoInput(
                    //   controller: _anexoController,
                    //   callback: (value) =>
                    //       setState(() => _anexoController.text = value),
                    // ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        onPressed: () => confirmTask(context),
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
