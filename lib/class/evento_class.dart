import 'package:tarefas_app/class/endereco_class.dart';

class EventoModel {
  late EnderecoModel endereco;
  late String link;
  late String horario;

  EventoModel({
    required this.endereco,
    required this.link,
    required this.horario,
  });
}
