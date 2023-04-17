import 'package:hive/hive.dart';

class TarefaHive {
  final _tarefaBox = Hive.box('tarefa');

  addTarefa(Map<String, dynamic> tarefa) {
    _tarefaBox.add(tarefa);
  }

  getAllTarefas() {
    return _tarefaBox.values.toList();
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

  Future<void> clearTarefas() async {
    await _tarefaBox.clear();
  }
}
