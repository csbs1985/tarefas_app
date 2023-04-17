import 'package:hive/hive.dart';
import 'package:tarefas_app/class/usuario_class.dart';

class TarefaHive {
  final _tarefaBox = Hive.box('tarefa');

  addTarefa(Map<String, dynamic> tarefa) {
    _tarefaBox.add(tarefa);
  }

  getAllTarefas() {
    var tarefas = _tarefaBox.values
        .where((element) => element['idUsuario'] == currentUsuario.value![''])
        .toList();

    return tarefas;
  }

  getAllPlanejados() {
    var tarefas = _tarefaBox.values
        .where((element) => element['concluida'] == false)
        .toList();

    return tarefas;
  }

  deleteTarefa() {
    _tarefaBox.delete(0);
  }

  readTarefa() {
    return _tarefaBox.get(1);
  }

  checkTarefa() {
    return _tarefaBox.isNotEmpty;
  }
}
