import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaFirebase {
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

  postTarefa(Map<String, dynamic> tarefa) {
    return tarefas.doc(tarefa['id']).set(tarefa);
  }
}
