import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:tarefas_app/appbars/titulo_appbar.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/classes/usuario_class.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
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
  void initState() {
    super.initState();
    currentCor.value = UiColor.planejados;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: currentUsuario,
          builder: (BuildContext context, value, __) {
            return Column(
              children: [
                const TituloAppbar(page: PageEnum.planejados),
                if (currentUsuario.value!['email'] != null)
                  FirestoreListView<Map<String, dynamic>>(
                    query: _tarefaFirebase.getAllTarefas(),
                    pageSize: 25,
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    loadingBuilder: (context) => const ItemTarefaSkeleton(),
                    errorBuilder: (context, error, _) =>
                        const SemResultadoWidget(),
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
            );
          },
        ),
      ),
    );
  }
}
