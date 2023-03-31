import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/widget/appbar_titulo_widget.dart';
import 'package:tarefas_app/widget/tarefa_item_widget.dart';

class PlanejamentoPage extends StatefulWidget {
  const PlanejamentoPage({Key? key}) : super(key: key);

  @override
  State<PlanejamentoPage> createState() => _PlanejamentoPageState();
}

class _PlanejamentoPageState extends State<PlanejamentoPage> {
  final tabelaQuery = FirebaseFirestore.instance
      .collection('tarefas')
      .where('idUsuario', isEqualTo: 'idUsuarioTemp');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const AppBarTituloWidget(page: PageEnum.planejados),
          FirestoreListView<Map<String, dynamic>>(
            query: tabelaQuery,
            pageSize: 25,
            shrinkWrap: true,
            reverse: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
            loadingBuilder: (context) => const Text('loading'),
            errorBuilder: (context, error, _) => const Text('error'),
            itemBuilder: (BuildContext context,
                QueryDocumentSnapshot<dynamic> snapshot) {
              Map<String, dynamic> tarefa = snapshot.data();
              return TarefaItemWidget(item: tarefa);
            },
          ),
        ],
      ),
    );
  }
}
