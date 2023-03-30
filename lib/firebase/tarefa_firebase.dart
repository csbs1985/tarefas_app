import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaFirebase {
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

  getAllTarefas(String idUsuario) {
    return tarefas.where('idUsuario', isEqualTo: idUsuario);
  }

  getTarefa(String IdTarefa) {
    return tarefas.where('id', isEqualTo: IdTarefa).get();
  }

  pathTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).update({'aberto': tarefa['aberto']});
  }

  postTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).set(tarefa);
  }
}
