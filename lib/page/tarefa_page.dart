import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/appbar/appbar.dart';
import 'package:tarefas_app/class/frequencia_class.dart';
import 'package:tarefas_app/class/local_notification_classs.dart';
import 'package:tarefas_app/class/page_class.dart';
import 'package:tarefas_app/class/tarefa_class.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';
import 'package:tarefas_app/class/tipo_select_class.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/core/routes.dart';
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
import 'package:tarefas_app/widget/perfil_drawer.dart';
import 'package:tarefas_app/widget/toast_widget.dart';
import 'package:uuid/uuid.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  late FirebaseFirestore db;
  late FirebaseAuth auth;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final FrequenciaClass _frequenciaClass = FrequenciaClass();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LocalNotificationClass _localNotificationClass =
      LocalNotificationClass();
  final Uuid _uuid = const Uuid();
  final TarefaClass _tarefaClass = TarefaClass();
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
    currentCor.value = UiColor.tarefa;
    currentTarefa.value != null
        ? popularController()
        : _tipoTarefaController.text = TipoTarefaEnum.aniversario.value;
  }

  void popularController() {
    _nomeController.text = currentTarefa.value!['tarefa'];
    _tipoTarefaController.text = currentTarefa.value!['tipoTarefa'];
    _diaController.text = currentTarefa.value!['dia'];
    _notificacaoController.text = currentTarefa.value!['notificacao'];
    _valorController.text = currentTarefa.value!['valor!'];
    _tipoMovimentacaoController.text = currentTarefa.value!['tipoMovimentacao'];
    _formaPagamentoController.text = currentTarefa.value!['formaPagamento!'];
    _anotacaoController.text = currentTarefa.value!['anotacao!'];
    _telefoneController.text = currentTarefa.value!['telefone'];
    _enderecoController.text = currentTarefa.value!['endereco'];
    _horarioController.text = currentTarefa.value!['horario!'];
    _linkController.text = currentTarefa.value!['link!'];
    _anexoController.text = currentTarefa.value!['anexo'];
    _frequenciaController.text =
        _frequenciaClass.mapToString(currentTarefa.value!['frequencia']);
  }

  bool candFrequencia() {
    return _tipoTarefaController.text == TipoTarefaEnum.aniversario.value
        ? false
        : true;
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
    clearTarefa();

    setState(() {
      if (callback == "") {
        _tipoTarefaController.text = ListaTipoTarefa.first.text;
        return;
      }
      _tipoTarefaController.text = callback;
    });
  }

  void clearTarefa() {
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

  void onFloatingActionButton(BuildContext context) {
    if (_nomeController.text != "" && _notificacaoController.text != "") {
      try {
        currentTarefa.value == null ? postTarefa() : pathTarefa();
        Navigator.pop(context);
      } on Exception {
        _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_ERRO_POST);
      }
    } else
      _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_VAZIA);
  }

  void postTarefa() {
    _tarefa = {
      'id': _uuid.v4(),
      'dataCriacao': DateTime.now().toString(),
      'idUsuario': currentUsuario.value!['email'],
      'tarefa': _nomeController.text,
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
      'concluida': false,
    };

    _tarefaClass.postTarefa(_tarefa);
    _createLocalNotificacao(_tarefa);
    _toastWidget.toast(context, ToastEnum.SUCESSO.value, TAREFA_CRIADA);
    context.go(RouteEnum.PLANEJADOS.value);
  }

  void pathTarefa() {
    _tarefa = {
      'id': currentTarefa.value!['id'],
      'dataCriacao': currentTarefa.value!['dataCriacao'],
      'idUsuario': currentTarefa.value!['idUsuario'],
      'tarefa': _nomeController.text,
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
      'concluida': currentTarefa.value!['concluida'],
    };

    _tarefaClass.pathTarefa(_tarefa);
    _createLocalNotificacao(_tarefa);
    _toastWidget.toast(context, ToastEnum.SUCESSO.value, TAREFA_ALTERADA);
    context.go(RouteEnum.PLANEJADOS.value);
  }

  _createLocalNotificacao(Map<String, dynamic> tarefa) {
    DateTime dataAtual = DateTime.now();
    DateTime dataNotificacao = DateTime.parse(tarefa['notificacao']);

    if (dataNotificacao.compareTo(dataAtual) > 0) {
      _localNotificationClass.createNewNotification(_tarefa);
    }
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

    currentTarefa.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const PerfilDrawer(),
      appBar: Appbar(
        page: PageEnum.tarefa,
        callback: () => scaffoldKey.currentState!.openDrawer(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SelectInput(
                controller: _tipoTarefaController,
                tipo: TipoSelectEnum.tipoTarefa,
                border: false,
                callback: (value) => callbackTipoTarefa(value),
              ),
              TextoInput(
                controller: _nomeController,
                label: _tipoTarefaController.text ==
                        TipoTarefaEnum.aniversario.value
                    ? ANIVERSARIANTE
                    : TAREFA,
                callback: (value) => _nomeController.text = value,
              ),
              if (candFrequencia())
                FrequenciaInput(
                  controller: _frequenciaController,
                  callback: (value) => _frequenciaController.text = value,
                ),
              CalendarioInput(
                controller: _diaController,
                callback: (value) => _diaController.text = value,
              ),
              NotificacaoInput(
                controller: _notificacaoController,
                callback: (value) => _notificacaoController.text = value,
              ),
              if (onlyFinanceiro())
                SelectInput(
                  controller: _tipoMovimentacaoController,
                  tipo: TipoSelectEnum.tipoMovimentacao,
                  callback: (value) => _tipoMovimentacaoController.text = value,
                ),
              if (onlyFinanceiro())
                SelectInput(
                  controller: _formaPagamentoController,
                  tipo: TipoSelectEnum.formaMovimentacao,
                  callback: (value) => _formaPagamentoController.text = value,
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.tarefa,
        onPressed: () => onFloatingActionButton(context),
        child: SvgPicture.asset(UiSvg.confirmar),
      ),
    );
  }
}
