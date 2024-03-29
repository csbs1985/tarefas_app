import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tarefas_app/class/usuario_class.dart';

class TarefaFirebase {
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

  getAllTarefasConcluidas() {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .where('concluida', isEqualTo: true)
        .orderBy('notificacao', descending: true);
  }

  getAllTarefasPlanejados() {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .where('concluida', isEqualTo: false)
        .orderBy('notificacao', descending: true);
  }

  getAllTarefasTodas() {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .orderBy('notificacao', descending: true);
  }

  getAllTarefasCalendario(String data) {
    return tarefas
        .where('idUsuario', isEqualTo: currentUsuario.value!['email'])
        .where('dia', isEqualTo: data)
        .orderBy('notificacao', descending: true);
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
