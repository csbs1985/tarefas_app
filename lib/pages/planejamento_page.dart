import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/appbars/titulo_appbar.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/classes/tarefa_class.dart';
import 'package:tarefas_app/classes/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/sem_resultado_widget.dart';
import 'package:tarefas_app/widget/tarefa_item_widget.dart';

class PlanejamentoPage extends StatefulWidget {
  const PlanejamentoPage({Key? key}) : super(key: key);

  @override
  State<PlanejamentoPage> createState() => _PlanejamentoPageState();
}

class _PlanejamentoPageState extends State<PlanejamentoPage> {
  final AuthService _authService = AuthService();
  final TarefaClass _tarefaClass = TarefaClass();
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();
  final UsuarioClass _usuarioClass = UsuarioClass();

  PageController pageController = PageController();

  Map<String, dynamic>? _tarefa;

  @override
  void initState() {
    super.initState();
    currentCor.value = UiColor.planejados;
    signInWithGoogle(context);
    pageController = PageController(initialPage: currentPageInt.value);
  }

  void signInWithGoogle(BuildContext context) async {
    await _authService
        .signInWithGoogle(context)
        .then((user) => setState(() => _usuarioClass.setUsuario(user!)));
  }

  void setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  void _openModal(BuildContext context) {
    setState(() => currentTarefa.value = _tarefa);
    _tarefaClass.openModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 8,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: currentUsuario,
                builder: (BuildContext context, value, __) {
                  return Column(
                    children: [
                      const TituloAppbar(page: PageEnum.planejados),
                      if (currentUsuario.value!['email'] != null)
                        FirestoreListView<Map<String, dynamic>>(
                          query: _tarefaFirebase.getTarefasPlanejados(),
                          pageSize: 25,
                          shrinkWrap: true,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          loadingBuilder: (context) =>
                              const ItemTarefaSkeleton(),
                          errorBuilder: (context, error, _) =>
                              const SemResultadoWidget(),
                          emptyBuilder: (context) => const SemResultadoWidget(),
                          itemBuilder: (BuildContext context,
                              QueryDocumentSnapshot<dynamic> snapshot) {
                            _tarefa = snapshot.data();
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TarefaItemWidget(item: _tarefa!),
                            );
                          },
                        ),
                      const SizedBox(height: 90)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentCor.value,
        elevation: 0,
        onPressed: () => _openModal(context),
        child: SvgPicture.asset(UiSvg.criar),
      ),
    );
  }
}
