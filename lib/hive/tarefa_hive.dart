import 'package:hive/hive.dart';

class TarefaHive {
  final _tarefaBox = Hive.box('tarefa');

  addUsuario(Map<String, dynamic> usuario) {
    _tarefaBox.add(usuario);
  }

  deleteUsuario() {
    _tarefaBox.delete(0);
  }

  readUsuario() {
    return _tarefaBox.get(1);
  }

  checkUsuario() {
    return _tarefaBox.isNotEmpty;
  }
}
