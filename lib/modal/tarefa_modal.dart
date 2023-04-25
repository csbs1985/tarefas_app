import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/class/frequencia_class.dart';
import 'package:tarefas_app/class/notificacao_class.dart';
import 'package:tarefas_app/class/recorrencia_class.dart';
import 'package:tarefas_app/class/tarefa_class.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';
import 'package:tarefas_app/class/tipo_select_class.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/input/anotacao_input.dart';
import 'package:tarefas_app/input/calendario_input.dart';
import 'package:tarefas_app/input/endereco_input.dart';
import 'package:tarefas_app/input/frequencia_input.dart';
import 'package:tarefas_app/input/horario_input.dart';
import 'package:tarefas_app/input/link_input.dart';
import 'package:tarefas_app/input/notificacao_input%20.dart';
import 'package:tarefas_app/input/select_input.dart';
import 'package:tarefas_app/input/telefone_input.dart';
import 'package:tarefas_app/input/texto_input.dart';
import 'package:tarefas_app/input/valor_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/toast_widget.dart';
import 'package:uuid/uuid.dart';

class TarefaModal extends StatefulWidget {
  const TarefaModal({super.key});

  @override
  State<TarefaModal> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaModal> {
  late FirebaseFirestore db;
  late FirebaseAuth auth;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final FrequenciaClass _frequenciaClass = FrequenciaClass();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  final TextEditingController _formaMovimentacaoController =
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
    _valorController.text = currentTarefa.value!['valor'];
    _tipoMovimentacaoController.text = currentTarefa.value!['tipoMovimentacao'];
    _formaMovimentacaoController.text = currentTarefa.value!['formaPagamento'];
    _anotacaoController.text = currentTarefa.value!['anotacao'];
    _telefoneController.text = currentTarefa.value!['telefone'];
    _enderecoController.text = currentTarefa.value!['endereco'];
    _horarioController.text = currentTarefa.value!['horario'];
    _linkController.text = currentTarefa.value!['link'];
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
        _tipoTarefaController.text = ListaTipoTarefa.first.tipo.value;
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
    _formaMovimentacaoController.clear();
    _anotacaoController.clear();
    _telefoneController.clear();
    _enderecoController.clear();
    _horarioController.clear();
    _linkController.clear();
    _anexoController.clear();
  }

  void onFloatingActionButton(BuildContext context) {
    if (_nomeController.text != "" && _notificacaoController.text != "")
      try {
        fillTarefa();
        currentTarefa.value == null ? postTarefa() : pathTarefa();
        Navigator.pop(context);
      } on Exception {
        _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_ERRO_POST);
      }
    else
      _toastWidget.toast(context, ToastEnum.ALERTA.value, TAREFA_VAZIA);
  }

  void fillTarefa() {
    Map<String, dynamic> frequenciaMap = {};

    if (_tipoTarefaController.text == TipoTarefaEnum.aniversario.value) {
      frequenciaMap = {
        'aCada': {
          'periodo': "",
          'quantidade': "",
        },
        'recorrencia': {
          'tipo': RecorrenciaEnum.anual.value,
        },
        'parcela': {
          'parcelaAtual': "",
          'parcelaTotal': "",
          'parcelaInicial': "",
        },
      };
    } else {
      frequenciaMap = _frequenciaClass.stringToMap(_frequenciaController.text);
    }

    _tarefa = {
      'idTarefa': _uuid.v4(),
      'anexo': _anexoController.text,
      'anotacao': _anotacaoController.text,
      'evento': {
        'endereco': _enderecoController.text,
        'link': _linkController.text,
        'horario': _horarioController.text,
      },
      'financeiro': {
        'valor': _valorController.text,
        'formaMovimentacao': {
          'forma': _formaMovimentacaoController.text,
        },
        'tipoMovimentacao': {
          'tipo': _tipoMovimentacaoController.text,
        },
      },
      'frequencia': {
        'aCada': {
          'periodo': frequenciaMap['aCada']['periodo'],
          'quantidade': frequenciaMap['aCada']['quantidade'],
        },
        'recorrencia': {
          'tipo': frequenciaMap['recorrencia']['tipo'],
        },
        'parcela': {
          'parcelaAtual': frequenciaMap['parcela']['parcelaAtual'],
          'parcelaInicial': frequenciaMap['parcela']['parcelaInicial'],
          'parcelaTotal': frequenciaMap['parcela']['parcelaTotal'],
        },
      },
      'idUsuario': currentUsuario.value!['email'],
      'ligar': {
        'telefone': _telefoneController.text,
      },
      'notificacao': [
        {
          'dataHora': _notificacaoController.text,
          'situacao': NotificacaoSituacaoEnum.aberta.value,
        },
      ],
      'tarefa': _nomeController.text,
      'tipoTarefa': _tipoTarefaController.text,
    };
  }

  void postTarefa() {
    _tarefaClass.postTarefa(_tarefa);
    _toastWidget.toast(context, ToastEnum.SUCESSO.value, TAREFA_CRIADA);
  }

  void pathTarefa() {
    _tarefaClass.pathTarefa(_tarefa);
    _toastWidget.toast(context, ToastEnum.SUCESSO.value, TAREFA_ALTERADA);
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
    _formaMovimentacaoController.dispose();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
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
                  controller: _formaMovimentacaoController,
                  tipo: TipoSelectEnum.formaMovimentacao,
                  callback: (value) =>
                      _formaMovimentacaoController.text = value,
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
