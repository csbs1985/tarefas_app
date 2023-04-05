import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tarefas_app/classes/usuario_class.dart';

class TarefaFirebase {
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

  getAllTarefas() {
    return tarefas.where('id', isEqualTo: currentUsuario.value!['email']);
  }

  getAllTarefasDia(String data) {
    return tarefas
        .where('id', isEqualTo: currentUsuario.value)
        .where('dia', isEqualTo: data);
  }

  getTarefa(String IdTarefa) {
    return tarefas.where('id', isEqualTo: IdTarefa).get();
  }

  pathTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).update(tarefa);
  }

  pathTarefaAberto(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).update({'concluida': tarefa['concluida']});
  }

  postTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).set(tarefa);
  }
}
