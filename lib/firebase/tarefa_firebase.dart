import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tarefas_app/classes/usuario_class.dart';

class TarefaFirebase {
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

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

  getTarefa(String IdTarefa) {
    return tarefas.where('idUsuario', isEqualTo: IdTarefa).get();
  }

  pathTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['idUsuario']).update(tarefa);
  }

  pathTarefaConcluida(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).update({'concluida': tarefa['concluida']});
  }

  postTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['idUsuario']).set(tarefa);
  }
}
