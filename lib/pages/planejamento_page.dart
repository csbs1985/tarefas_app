import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/widget/appbar_titulo_widget.dart';
import 'package:tarefas_app/widget/sem_resultado_widget.dart';
import 'package:tarefas_app/widget/tarefa_item_widget.dart';

class PlanejamentoPage extends StatefulWidget {
  const PlanejamentoPage({Key? key}) : super(key: key);

  @override
  State<PlanejamentoPage> createState() => _PlanejamentoPageState();
}

class _PlanejamentoPageState extends State<PlanejamentoPage> {
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarTituloWidget(page: PageEnum.planejados),
            FirestoreListView<Map<String, dynamic>>(
              query: _tarefaFirebase.getAllTarefas(currentUsuario.value),
              pageSize: 25,
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              loadingBuilder: (context) => const ItemTarefaSkeleton(),
              errorBuilder: (context, error, _) => const SemResultadoWidget(),
              emptyBuilder: (context) => const SemResultadoWidget(),
              itemBuilder: (BuildContext context,
                  QueryDocumentSnapshot<dynamic> snapshot) {
                Map<String, dynamic> tarefa = snapshot.data();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TarefaItemWidget(item: tarefa),
                );
              },
            ),
            const SizedBox(height: 90)
          ],
        ),
      ),
    );
  }
}
