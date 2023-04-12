import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_app/appbars/appbar.dart';
import 'package:tarefas_app/classes/local_notification_classs.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/classes/tarefa_class.dart';
import 'package:tarefas_app/classes/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/hive/usuario_hive.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/perfil_drawer.dart';
import 'package:tarefas_app/widget/sem_resultado_widget.dart';
import 'package:tarefas_app/widget/item_tarefa_widget.dart';

class PlanejadosPage extends StatefulWidget {
  const PlanejadosPage({Key? key}) : super(key: key);

  @override
  State<PlanejadosPage> createState() => _PlanejamentoPageState();
}

class _PlanejamentoPageState extends State<PlanejadosPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _authService = AuthService();
  final TarefaClass _tarefaClass = TarefaClass();
  final TarefaFirebase _tarefaFirebase = TarefaFirebase();
  final UsuarioClass _usuarioClass = UsuarioClass();
  final UsuarioHive _usuarioHive = UsuarioHive();

  PageController pageController = PageController();

  Map<String, dynamic>? _tarefa;

  @override
  void initState() {
    super.initState();
    checkForNotifications();
    currentCor.value = UiColor.planejados;
    signInWithGoogle(context);
    pageController = PageController(initialPage: currentPageInt.value);
  }

  checkForNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  void signInWithGoogle(BuildContext context) async {
    if (_usuarioHive.checkUsuario()) {
      Map<String, dynamic> usuarioHive =
          _usuarioClass.mapDynamicToMapString(_usuarioHive.readUsuario());
      _usuarioClass.setUsuario(usuarioHive);
    } else {
      await _authService.signInWithGoogle(context).then((user) {
        Map<String, dynamic> userMap = _usuarioClass.userToMap(user!);
        setState(() => _usuarioClass.setUsuario(userMap));
      });
    }
  }

  void setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  void _openModal(BuildContext context) {
    // _tarefaClass.openModal(context);
    LocalNotificationsTests();
  }

  void LocalNotificationsTests() {
    Provider.of<NotificationService>(context, listen: false)
        .showLocalNotification(LocalNotificationModel(
      id: 0,
      title: "titulo da notificação",
      body: 'corpo da notificação',
      payload: RouteEnum.PLANEJADOS.value,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: Appbar(
        page: PageEnum.planejados,
        callback: () => scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: const PerfilDrawer(),
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
                              child: ItemTarefaWidget(
                                pagina: RouteEnum.PLANEJADOS.value,
                                tarefa: _tarefa!,
                              ),
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
