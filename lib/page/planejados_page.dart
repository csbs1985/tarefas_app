import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_app/appbar/appbar.dart';
import 'package:tarefas_app/class/local_notification_classs.dart';
import 'package:tarefas_app/class/page_class.dart';
import 'package:tarefas_app/class/tarefa_class.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/firebase/tarefa_firebase.dart';
import 'package:tarefas_app/hive/usuario_hive.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/perfil_drawer.dart';
import 'package:tarefas_app/widget/sem_resultado_widget.dart';
import 'package:tarefas_app/item/planejados_item.dart';

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
    localNotifications();
    currentCor.value = UiColor.planejados;
    signInWithGoogle(context);
    pageController = PageController(initialPage: currentPageInt.value);
  }

  localNotifications() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed)
        AwesomeNotifications().requestPermissionToSendNotifications();
    });
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

  Future<void> _openModal(BuildContext context) async {
    // _tarefaClass.openModal(context);
    await Provider.of<LocalNotificationClass>(context, listen: false)
        .createNewNotification();
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
                              child: PlanejadosItem(tarefa: _tarefa!),
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
