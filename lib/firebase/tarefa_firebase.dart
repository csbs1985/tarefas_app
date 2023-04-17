import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tarefas_app/class/usuario_class.dart';

class TarefaFirebase {
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

  getTarefasConcluidas() {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .where('concluida', isEqualTo: true)
        .orderBy('notificacao', descending: true);
  }

  getTarefasPlanejados() {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .where('concluida', isEqualTo: false)
        .orderBy('notificacao', descending: true);
  }

  getAllTarefasDia(String data) {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value)
        .where('dia', isEqualTo: data);
  }

  getAllTarefa() {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .get();
  }

  pathTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).update(tarefa);
  }

  pathTarefaConcluida(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).update({'concluida': tarefa['concluida']});
  }

  postTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).set(tarefa);
  }
}
