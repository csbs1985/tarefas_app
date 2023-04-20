import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/class/page_class.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/item/concluidas_item.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/appbar/appbar.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/perfil_drawer.dart';
import 'package:tarefas_app/widget/sem_resultado_widget.dart';

class ConcluidasPage extends StatefulWidget {
  const ConcluidasPage({Key? key}) : super(key: key);

  @override
  State<ConcluidasPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcluidasPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();

  Map<String, dynamic>? _tarefa;

  @override
  void initState() {
    super.initState();
    currentCor.value = UiColor.concluidas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: Appbar(
        page: PageEnum.concluidas,
        callback: () => scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: const PerfilDrawer(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (currentUsuario.value!['email'] != null)
                FirestoreListView<Map<String, dynamic>>(
                  query: _tarefaFirebase.getAllTarefasConcluidas(),
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
                    _tarefa = snapshot.data();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ConcluidasItem(tarefa: _tarefa!),
                    );
                  },
                ),
              const SizedBox(height: 90)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentCor.value,
        elevation: 0,
        onPressed: () => context.go(RouteEnum.TAREFA.value),
        child: SvgPicture.asset(UiSvg.criar),
      ),
    );
  }
}
